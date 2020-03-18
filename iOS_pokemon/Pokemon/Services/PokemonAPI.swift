//
//  PokemonAPI.swift
//  Pokemon
//
//  Created by Claire on 02/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PokemonAPI {
    var jsonParser = JSONParser()

    func getPokemons(completion: @escaping (([Pokemon]) -> Void)) {
        if let path = Bundle.main.path(forResource: "pokemon", ofType: "json") {
            let url = URL(fileURLWithPath: path)

            Alamofire.request(url).responseJSON { response in

                guard let jsonResponse = response.result.value else {
                    return // TODO: error handling
                }
                let json = JSON(jsonResponse)

                let pokemons = json.arrayValue.map { self.jsonParser.bindToPokemon(json: $0) }
                completion(pokemons)
            }
        }
    }

}
