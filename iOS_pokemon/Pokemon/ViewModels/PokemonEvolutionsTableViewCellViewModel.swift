//
//  PokemonEvolutionsTableViewCellViewModel.swift
//  Pokemon
//
//  Created by Claire on 24/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation

protocol PokemonEvolutionsTableViewCellProtocol {
    var pokemons: [Pokemon] { get }
    var pokemonSelected: ((Pokemon) -> Void) { get }
}

struct PokemonEvolutionsTableViewCellViewModel: PokemonEvolutionsTableViewCellProtocol {
    let pokemons: [Pokemon]
    let pokemonSelected: ((Pokemon) -> Void)
}
