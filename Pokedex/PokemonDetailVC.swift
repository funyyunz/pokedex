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
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImage.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            
            self.updateUI()
            
        }
    }
    
    func updateUI() {
        typeLabel.text = pokemon.type
        descLabel.text = pokemon.desc
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.hidden = true
        } else {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            evoLabel.text = str
        }
        
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
