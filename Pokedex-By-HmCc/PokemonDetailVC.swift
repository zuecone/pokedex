//
//  PokemonDetailVC.swift
//  Pokedex-By-HmCc
//
//  Created by david johnson on 2016/10/09.
//  Copyright © 2016 hiddenplatform. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var pokeLabel: UILabel!
    
    override func viewDidLoad() {
        pokeLabel.text = pokemon.name.capitalizedString
    }
    
    
}
