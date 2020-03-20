//
//  CalculatorTableViewCellviewModel.swift
//  Pokemon
//
//  Created by Ivann Galic on 19/03/2020.
//  Copyright © 2020 Jeremy. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorTableViewCellviewModel {
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
