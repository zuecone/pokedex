//
//  Pokemon.swift
//  Pokedex-By-HmCc
//
//  Created by david johnson on 2016/10/01.
//  Copyright © 2016 hiddenplatform. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionTxt: String!
    private var _nextEvoltuionLvl: String!
    
    private var _pokemonURL: String!
    
    
    var name: String {
       return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"

    }
    
    func downloadPokemDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                print(self._defense)
                print(self._attack)
                print(self._height)
                print(self._weight)
                
                
                //nice where clause to only run when there are values
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0 {
                    
                    if let type = types[0]["name"]{
                        self._type = type.capitalizedString
                    }
                    
                    if types.count > 1{
                        for var x = 1; x < types.count; x+=1 {
                            if let name = types[x]["name"]{
                                self._type = self._type + " / \(name.capitalizedString)"
                            }
                        }
                    }else{
                        self._type = ""
                    }
                    
                    print(self._type)
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String,String>] where descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"]{
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        Alamofire.request(.GET, nsurl).responseJSON { response in
                            let newResult = response.result

                         
                            if let descDict = newResult.value as? Dictionary<String,AnyObject> {
                                //print(descDict)
                                
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                    print(self._description)
                                }
                            }
                        }
                        
                    }
                    else
                    { self._description = ""
                    }
                    
                    if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0 {
                        if let to = evolutions[0]["to"] as? String{
                         
                            if to.rangeOfString("mega") == nil {
                                if let uri = evolutions[0]["resource_uri"] as? String{
                                    let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                                    let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                    self._nextEvolutionId = num
                                    self._nextEvolutionTxt = to
                                    
                                    if let lvl = evolutions[0]["level"] as? Int {
                                        self._nextEvoltuionLvl = "\(lvl)"
                                    }
                                    print(self._nextEvoltuionLvl)
                                    print(self._nextEvolutionTxt)
                                    print(self._nextEvolutionId)
                                    
                                }
                            }
                        }
                        
                    }
                }
                
            }
            
        }
    }
    
}