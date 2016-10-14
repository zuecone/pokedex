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
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemDetails {
            //this will be called after the download is complete
            
        self.updateUI()
            
        }
    }
    
    func updateUI(){
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.heigh
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        baseAttackLbl.text = pokemon.attack
        weightLbl.text = pokemon.weight
        
        
        if pokemon.nextEvolutionId == ""{
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        }else{
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLvl != ""{
            str += " - LVL \(pokemon.nextEvolutionLvl)"
                evoLbl.text = str
            }
        }
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
