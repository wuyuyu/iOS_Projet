//
//  PokemonDetailsViewController.swift
//  Pokemon
//
//  Created by Claire on 24/03/2019.
//  Copyright © 2019 Claire. All rights reserved.


import UIKit

class PokemonDetailsViewController: UIViewController {
    var pokemon: Pokemon! // pokemon chosen from the list


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var typeStackView: UIStackView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
       super.viewDidLoad()
        photo.image = nil
        
        // ad setup UI
        pokemonNameLabel.text = pokemon.name
        idLabel.text = "\(pokemon.pokedexId)"
        descriptionLabel.text = pokemon.description
        
        if URL(string: pokemon.imageUrl) != nil {
        // image du pokemon
            let url = NSURL(string: pokemon.imageUrl)! as URL
            if let data: NSData = NSData(contentsOf: url) {
                photo.image = UIImage(data: data as Data)
            } else {
              photo.image = UIImage(named: "dragon")
            }
    }
}
    private func setUpPokemonType([Type])
}
