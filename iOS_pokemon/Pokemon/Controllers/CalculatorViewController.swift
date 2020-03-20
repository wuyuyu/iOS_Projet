//
//  CalculatorViewController.swift
//  Pokemon
//
//  Created by Laurent  Bodin on 19/03/2020.
//  Copyright © 2020 Jeremy. All rights reserved.
//

import Foundation
import UIKit

private enum attaquePossibilities: Int {
    case weakness
    case strength
    case immunity
}

class CalculatorViewController: UIViewController{
    var pokemonApi = PokemonAPI()
    var myPokemons: [Pokemon] = []
    var weaknessTab: [Pokemon] = []
    @IBOutlet weak var CalculatorSegmentedButtons: UISegmentedControl!
    @IBOutlet weak var CalculatorView: UIView!
    @IBOutlet weak var CalculatorTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        pokemonApi.getPokemons { [weak self]
            pokemons in guard let self = self else {
                return
            }
            self.myPokemons = pokemons
            self.FilterWeakness(self.CalculatorSegmentedButtons)
        }
        //CalculatorView.roundCorners(corners:[.topLeft,.topRight ], radius: 12.0)
    }
    @IBAction private func FilterWeakness (_ sender: Any) {
        switch attaquePossibilities(rawValue:
            CalculatorSegmentedButtons.selectedSegmentIndex) {
        case .weakness:
            
        default:
            weaknessTab = []
        }
    }
}

// MARK: - UITableViewDelegate / Datasource
extension CalculatorViewController: UITableViewDelegate, UITableViewDataSource {
    // Required method to tell the tableview how many sections it has (here 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Required method to tell the tableview how many rows it has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPokemons.count
    }

    // Required method to initialize the tableview cell for the index shown in the screen
    // (called anytime a cell is about to be seen in the screen)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialization of the table view cell that is created in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath)
        // Getting pokemon related to the tableview index in order to be able to show its details
        let currentPokemon = myPokemons[indexPath.row]

        // Creation of a object to pass all required datas to the cell (pokemonName / pokedexID / pokemon image url)
        // cellIndex is used to be able to handle the pokemon image correctly as it will be downloaded asynchronously from the Internet
        let pokemonViewModel = PokemonTableViewCellViewModel(cellIndex: indexPath.row,
                                                             pokemonName: currentPokemon.name,
                                                             pokemonNumber: currentPokemon.pokedexId,
                                                             pokemonImageUrl: currentPokemon.imageUrl)

        // Since cell object is of type UITableViewCell, we have to cast it to PokemonTableViewCell so we can pass the object created above
        (cell as? PokemonTableViewCell)?.viewModel = pokemonViewModel

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}
