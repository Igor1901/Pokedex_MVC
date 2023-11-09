//
//  Service.swift
//  Pokedex
//
//  Created by Игорь Пачкин on 19/10/23.
//

import UIKit

class Service {
    
    
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchPokemon(completion: @escaping ([Pokemon]) -> ()){
        var pokemonArray = [Pokemon]()
        
        guard let url = URL(string: BASE_URL) else {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else {return }
            
            do {
                guard let resulteArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {return}
                //print(resulteArray)
                for (key, result) in resulteArray.enumerated(){
                    if let dictionary = result as? [String: AnyObject]{
                        let pokemon = Pokemon(id: key, dictionary: dictionary)
                        pokemonArray.append(pokemon)
                    }
                    completion(pokemonArray)
                }
            } catch let error {
                print("Failed to fetch json with error: ", error.localizedDescription)
            }
        }.resume()
    }
}
