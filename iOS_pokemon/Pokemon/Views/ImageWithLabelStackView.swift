//
//  ImageWithLabelStackView.swift
//  Pokemon
//
//  Created by Jeremy on 28/03/2019.
//  Copyright © 2019 Jeremy. All rights reserved.
//

import UIKit

class ImageWithLabelStackView: UIStackView {
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    private var imageViewWidthConstraint: NSLayoutConstraint!
    var itemSelected: (() -> Void)?
    var frameObserver: NSKeyValueObservation?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 5.0

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(tap)

        setupImageView()
        setupNameLabel()

        frameObserver = nameLabel.observe(\.bounds, options: [.new], changeHandler: { (_, _) in
            if self.imageView.bounds.width > self.nameLabel.bounds.width {
                self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
                self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            }
            self.layoutIfNeeded()
        })
    }

    func setupImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(imageView)
//        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.addConstraint(NSLayoutConstraint(item: imageView,
                                                   attribute: .width,
                                                   relatedBy: .equal,
                                                   toItem: imageView,
                                                   attribute: .height,
                                                   multiplier: 1.0,
                                                   constant: 0.0))
        imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .width,
                                                      relatedBy: .equal,
                                                      toItem: nil,
                                                      attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: 30.0)
        imageView.addConstraint(imageViewWidthConstraint)
        imageView.contentMode = .scaleAspectFit
    }

    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 12.0)
    }

    func updateView(with type: Type) {
        imageView.image = type.getIcon()
        nameLabel.text = type.rawValue.capitalized
    }

    func updateImageViewWidth(_ width: CGFloat) {
        imageViewWidthConstraint.constant = width
    }

    func updateView(with pokemon: Pokemon) {
        nameLabel.text = pokemon.name

        ImageDownloader.download(imageURLString: pokemon.imageUrl) { [weak self] result in
            switch result {
            case .success(let image):
                self?.imageView.image = image
            case .failure:
                self?.imageView.image = UIImage(named: "missingNo")
            }
        }
    }

    @objc private func handleTap() {
        itemSelected?()
    }
}
