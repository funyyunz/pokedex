//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Adam Lewandowski on 1/10/16.
//  Copyright © 2016 Adam Lewandowski. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
    }

}
