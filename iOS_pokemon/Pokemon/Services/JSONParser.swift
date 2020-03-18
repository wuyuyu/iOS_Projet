//
//  JSONParser.swift
//  Pokemon
//
//  Created by Claire on 02/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONParser {

    private enum Constants {
        static let identifierKey = "_id"
        static let pokedexIdKey = "pkdx_id"
        static let nameKey = "name"
        static let imageUrlKey = "image_url"
        static let typesKey = "types"
        static let descriptionKey = "description"
        static let evolutionsKey = "evolutions"
        static let methodKey = "method"
        static let levelKey = "level"
        static let toKey = "to"
    }

    func bindToPokemon(json: JSON) -> Pokemon {
        return Pokemon(identifier: json[Constants.identifierKey].stringValue,
                       pokedexId: json[Constants.pokedexIdKey].intValue,
                       name: json[Constants.nameKey].stringValue,
                       imageUrl: json[Constants.imageUrlKey].stringValue,
                       description: json[Constants.descriptionKey].stringValue,
                       types: bindToType(jsonArray: json[Constants.typesKey].arrayValue),
                       evolutions: bindToEvolutions(jsonArray: json[Constants.evolutionsKey].arrayValue))
    }

    func bindToType(jsonArray: [JSON]) -> [Type] {
        let types = jsonArray.compactMap { Type(rawValue: $0.stringValue) }
        return types
    }

    func bindToEvolutions(jsonArray: [JSON]) -> [Evolution] {
        let evolutions = jsonArray.compactMap { json in

            Evolution(pokemonId: json[Constants.identifierKey].stringValue,
                      method: EvolutionMethod(method: json[Constants.methodKey].stringValue,
                                              level: json[Constants.levelKey].int),
                      name: json[Constants.toKey].stringValue)
        }

        return evolutions
    }
}
