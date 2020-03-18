//
//  PokemonTableViewCellViewModel.swift
//  Pokemon
//
//  Created by Claire on 07/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import UIKit

struct PokemonTableViewCellViewModel {
    let cellIndex: Int
    let pokemonName: String
    let pokemonNumber: String
    let pokemonImageURL: String

    init(cellIndex: Int,
         pokemonName: String,
         pokemonNumber: Int,
         pokemonImageUrl: String) {
        self.cellIndex = cellIndex
        self.pokemonName = pokemonName
        self.pokemonNumber = "#\(pokemonNumber)"
        self.pokemonImageURL = pokemonImageUrl
    }
}
