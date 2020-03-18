//
//  ViewController.swift
//  Pokemon
//
//  Created by Claire on 02/03/2019.
//  Copyright © 2019 Claire. All rights reserved.
//

import UIKit

private enum SortType: String {
    case name
    case pokedexID

    init(label: String?) {
        if label == "Name" {
            self = .name
        } else {
            self = .pokedexID
        }
    }
}

private enum SortOrder {
    case ascending
    case descending

    init(label: String?) {
        if label == "↓" {
            self = .ascending
        } else {
            self = .descending
        }
    }
}

class PokedexViewController: UIViewController {

    private let navigationIdentifier = "goToDetails"
    @IBOutlet private weak var pokedexTableView: UITableView!
    @IBOutlet private weak var sortTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var sortOrderSegmentedControl: UISegmentedControl!

    var pokemons: [Pokemon] = []
    var pokemonAPI = PokemonAPI()

    override func viewDidLoad() {
        super.viewDidLoad()

        pokemonAPI.getPokemons { [weak self] pokemons in
            self?.reloadPokedex(with: pokemons)
        }
    }

    private func reloadPokedex(with pokemons: [Pokemon]) {
        self.pokemons = pokemons

        pokedexTableView.reloadData()
    }

    // MARK: - UISegmentedControl
    @IBAction private func switchSortType(_ sender: Any) {
        // Init type enum to know if we sort by pokemon id or pokemon name
        let sortType = SortType(label: sortTypeSegmentedControl.titleForSegment(at: sortTypeSegmentedControl.selectedSegmentIndex))
        // Init order enum to know if the sort is of type ascending or descending
        let sortOrder = SortOrder(label: sortOrderSegmentedControl.titleForSegment(at: sortOrderSegmentedControl.selectedSegmentIndex))

        // sorted: Swift method to sort an Array
        pokemons = pokemons.sorted { firstElement, secondElement in
            if sortType == .name && sortOrder == .ascending { // Sort by pokemon name (a -> z)
                return firstElement.name < secondElement.name
            } else if sortType == .name && sortOrder == .descending { // Sort by pokemon name (z -> a)
                return firstElement.name > secondElement.name
            } else if sortType == .pokedexID && sortOrder == .ascending { // Sort by pokemon id (1 -> 151)
                return firstElement.pokedexId < secondElement.pokedexId
            }
            return firstElement.pokedexId > secondElement.pokedexId // Sort by pokemon id (151 -> 1)
        }
        pokedexTableView.reloadData()
    }

    // Method when clicking of the segment with the arrows
    @IBAction private func switchSortOrder(_ sender: Any) {
        pokemons.reverse() // Swift method to reverse the content of an Array
        pokedexTableView.reloadData()
    }

    // MARK: - Method used to navigate to the detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == navigationIdentifier {
            guard let pokemonIndex = pokedexTableView.indexPathForSelectedRow,
            let detailsViewController = segue.destination as? PokemonDetailsViewController else {
                return
            }
            detailsViewController.pokemon = pokemons[pokemonIndex.row]
        }
    }

}

// MARK: - UITableViewDelegate / Datasource
extension PokedexViewController: UITableViewDelegate, UITableViewDataSource {
    // Required method to tell the tableview how many sections it has (here 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Required method to tell the tableview how many rows it has
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    // Required method to initialize the tableview cell for the index shown in the screen
    // (called anytime a cell is about to be seen in the screen)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialization of the table view cell that is created in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonTableViewCell.self), for: indexPath)
        // Getting pokemon related to the tableview index in order to be able to show its details
        let currentPokemon = pokemons[indexPath.row]

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
