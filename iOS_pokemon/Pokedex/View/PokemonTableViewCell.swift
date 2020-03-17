//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Ivann Galic on 16/03/2020.
//

import Foundation
import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var PokemonImage: UIImageView!
    @IBOutlet private weak var PokemonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet private weak var PokemonId: UILabel!
    override func prepareForReuse() {
        super.prepareForReuse()
        PokemonImage.image = nil
        PokemonName.text = nil
        PokemonId.text = nil
    }
    
}

