//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Ivann Galic on 16/03/2020.
//

import Foundation
import UIKit

class PokedexViewController: UIViewController  {
    // TO-DO
}

extension PokedexViewController: UITableViewDelegate, UITableViewDataSource {
    func {
    numberOfSections(in tableView: UITableView) -> Int
    return 1
    }
    func {
    tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    return 151
    }
    func {
    tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    return cell
    }
}

