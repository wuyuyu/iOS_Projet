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
    case electric
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
        case .electric:
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
    
    func getTypeName()->String{
        switch self{
        case .bug:
            return "bug"
        case . poison:
            return "poison"
        case .dragon:
            return "dragon"
        case .electric:
            return "electric"
        case .fairy:
            return "fairy"
        case .fighting:
            return "fighting"
        case .fire:
            return "fire"
        case .flying:
            return "flying"
        case .ghost:
            return "ghost"
        case .steel:
            return "steel"
        case .normal:
            return "normal"
        case .ice:
            return "ice"
        case .ground:
            return "ground"
        case .grass:
            return "grass"
        case .water:
            return "water"
        case .psychic:
            return "psychic"
        case .rock:
            return "rock"
        }
    }
    
    func getWeakness() -> [Type]{
        switch self{
            case .bug:
                return [.fire, .rock, .flying]
            case .poison:
                return [.psychic,.ground]
            case .dragon:
                return [.ice,.dragon,.fairy]
            case .electric:
                return [.ground]
            case .fairy:
                return [.poison,.steel]
            case .fighting:
                return [.psychic,.flying,.fairy]
            case .fire:
                return [.water,.ground,.rock]
            case .flying:
                return [.electric,.rock,.ice]
            case .ghost:
                return [.ghost]
            case .steel:
                return [.fighting,.fire,.ground]
            case .normal:
                return [.fighting]
            case .ice:
                return [.fire,.fighting,.steel,.rock]
            case .ground:
                return [.water,.grass]
            case .grass:
                return [.fire,.ice,.bug,.poison,.flying]
            case .water:
                return [.electric, .grass]
            case .psychic:
                return [.ghost]
            case .rock:
                return [.water, .grass, .ground, .steel]
            }
    }
    
    func getStength() -> [Type]{
        switch self{
            case .bug:
                return [.fighting, .grass, .ground]
            case .poison:
                return [.fighting, .fairy, .bug, .grass, .poison]
            case .dragon:
                return [.dragon]
            case .electric:
                return [.water, .electric, .fire, .grass]
            case .fairy:
                return [.fighting, .bug]
            case .fighting:
                return [.bug, .rock]
            case .fire:
                return [.steel, .fairy, .fire, .ice, .bug, .grass]
            case .flying:
                return [.fighting, .bug, .grass]
            case .ghost:
                return [.bug, .poison]
            case .steel:
                return [.steel, .dragon, .fairy, .ice, .bug, .normal, .grass, .psychic, .rock, .flying]
            case .ice:
                return [.ice]
            case .ground:
                return [.poison, .rock]
            case .grass:
                return [.water, .electric, .grass, .ground]
            case .water:
                return [.water, .steel, .fire, .ice]
            case .psychic:
                return [.fighting, .psychic]
            case .rock:
                return [.fire, .normal, .poison, .flying]
            case .normal:
                return []
            }
    }
    
    func getImmunity() -> [Type]{
        switch self {
            case .normal:
                return [.ghost]
            case .fairy:
                return [.dragon]
            case .flying:
                return [.ground]
            case .ghost:
                return [.fighting, .normal]
            case .steel:
                return [.poison]
            case .ground:
                return [.electric]
            case .bug:
                 return []
             case .poison:
                 return []
             case .dragon:
                 return []
             case .electric:
                 return []
             case .fighting:
                return []
             case .fire:
                 return []
             case .ice:
                 return []
             case .grass:
                 return []
             case .water:
                 return []
             case .psychic:
                 return []
             case .rock:
                 return []
             }
        }
}
