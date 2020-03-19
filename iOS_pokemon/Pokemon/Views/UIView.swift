//
//  UIView.swift
//  Pokemon
//
//  Created by Claire on 26/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static let overlayViewTag = 42

    func addAnimatedOverlay() {
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        overlayView.tag = UIView.overlayViewTag
        self.addSubview(overlayView)
        overlayView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        overlayView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        overlayView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        UIView.animate(withDuration: 0.3) {
            overlayView.alpha = 0.58
        }
    }

    func removeOverlay() {
        if let overlayView = self.viewWithTag(UIView.overlayViewTag) {
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    overlayView.alpha = 0.0
            },
                completion: { _ in
                    overlayView.removeFromSuperview()
            })
        }
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
