//
//  PokemonDetailsViewController.swift
//  Pokemon
//
//  Created by Claire on 24/03/2019.
//  Copyright © 2019 Claire. All rights reserved.


import UIKit

class PokemonDetailsViewController: UIViewController {
    var pokemon: Pokemon! // pokemon chosen from the list


    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
       super.viewDidLoad()
        photo.image = nil
        
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
}
