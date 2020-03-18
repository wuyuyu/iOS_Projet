//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Claire on 07/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!
    @IBOutlet private weak var pokemonNumberLabel: UILabel!

    var cellIndex: Int = 0

    var viewModel: PokemonTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }

            cellIndex = viewModel.cellIndex
            pokemonNameLabel.text = viewModel.pokemonName
            pokemonNumberLabel.text = viewModel.pokemonNumber

            ImageDownloader.download(imageURLString: viewModel.pokemonImageURL) { [weak self] result in
                if self?.cellIndex == viewModel.cellIndex {
                    switch result {
                    case .success(let image):
                        self?.pokemonImageView.image = image
                    case .failure:
                        self?.pokemonImageView.image = UIImage(named: "missingNo")
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        pokemonImageView.image = nil
        pokemonNameLabel.text = nil
        pokemonNumberLabel.text = nil
    }
}
