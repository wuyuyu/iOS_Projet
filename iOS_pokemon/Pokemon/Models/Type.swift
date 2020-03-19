//
//  Type.swift
//  Pokemon
//
//  Created by Claire on 02/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import UIKit

enum Type: String {
    case bug
    case poison
    case electrik
    case fire
    case water
    case grass
    case flying
    case ground
    case psychic
    case ghost
    case fighting
    case dragon
    case normal
    case ice
    case fairy
    case steel
    case rock
    
    func getIcon()->UIImage?{
        switch self{
        case .bug:
            return UIImage(named :"bug")
        case . poison:
            return UIImage(named :"poison")
        case .dragon:
            return UIImage(named :"dragon")
        case .electrik:
            return UIImage(named :"electric")
        case .fairy:
            return UIImage(named :"fairy")
        case .fighting:
            return UIImage(named :"fighting")
        case .fire:
            return UIImage(named :"fire")
        case .flying:
            return UIImage(named :"flying")
        case .ghost:
            return UIImage(named :"ghost")
        case .steel:
            return UIImage(named :"steel")
        case .normal:
            return UIImage(named :"normal")
        case .ice:
            return UIImage(named :"ice")
        case .ground:
            return UIImage(named :"ground")
        case .grass:
            return UIImage(named :"grass")
        case .water:
            return UIImage(named :"water")
        case .psychic:
            return UIImage(named :"psychic")
        case .rock:
            return UIImage(named :"rock")
        }
    }
}
