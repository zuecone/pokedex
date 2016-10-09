//
//  PokemonDetailVC.swift
//  Pokedex-By-HmCc
//
//  Created by david johnson on 2016/10/09.
//  Copyright © 2016 hiddenplatform. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
   
    @IBOutlet weak var pokeLabel: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    
    override func viewDidLoad() {
        pokeLabel.text = pokemon.name.capitalizedString
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
