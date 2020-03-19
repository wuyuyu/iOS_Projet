//
//  PokemonDetailsViewController.swift
//  Pokemon
//
//  Created by Claire on 24/03/2019.
//  Copyright © 2019 Claire. All rights reserved.


import UIKit

class PokemonDetailsViewController: UIViewController {
    var pokemon: Pokemon! // pokemon chosen from the list


    @IBOutlet weak var type2View: UIImageView!
    @IBOutlet weak var labelType2: UILabel!
    @IBOutlet weak var type1View: UIImageView!
    @IBOutlet weak var labelType1: UILabel!
    @IBOutlet weak var tableView: UITableView!
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
        setUpPokemonType(type: pokemon.types)
}
    
    private var typeImageView : UIImageView!
    private var typeLabel: UILabel!
    private func setUpPokemonType(type:[Type]){
    type1View.image = type[0].getIcon()
        if type.count > 1 {
            type2View.image = type[1].getIcon()
        }
    }
    
}
