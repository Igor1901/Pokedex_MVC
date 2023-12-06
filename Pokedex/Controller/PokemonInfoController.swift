//
//  PokemonInfoController.swift
//  Pokedex
//
//  Created by Игорь Пачкин on 22/11/23.
//

import UIKit

class PokemonInfoController: UIViewController {
    

    
    var pokemon: Pokemon? { // передача данных 
        didSet {
            navigationItem.title = pokemon?.name?.capitalized
            imageView.image = pokemon?.image
            infoLabel.text = pokemon?.description
            infoView.pokemon = pokemon
            
            if let evoArray = pokemon?.evoArray{
                if evoArray.count > 1 {
                    firstEvoImageView.image = evoArray[0].image
                    secondEvoImageView.image = evoArray[1].image
                } else {
                    firstEvoImageView.image = evoArray[0].image
                }
            }
                
        }
    }
    
    let imageView: UIImageView = { // pokemon img
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let infoLabel: UILabel = { // description
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let infoView: InfoView = {
        let view = InfoView()
        view.configureViewForInfoController()
        return view
    }()
    
    //MARK: - Evo
    
     lazy var evolutionView: UIView = {
         let view = UIView()
         view.backgroundColor = .mainPink()
         
         view.addSubview(evoLabel)
         evoLabel.translatesAutoresizingMaskIntoConstraints = false
         evoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         evoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         
         return view
     }()
     
     let evoLabel: UILabel = {
         let label = UILabel()
         label.textColor = .white
         label.text = "Evolution Chain"
         label.font = UIFont.systemFont(ofSize: 18)
         return label
     }()
     
     let firstEvoImageView: UIImageView = {
         let iv = UIImageView()
         iv.contentMode = .scaleAspectFit
         return iv
     }()
     
     let secondEvoImageView: UIImageView = {
         let iv = UIImageView()
         iv.contentMode = .scaleAspectFit
         return iv
     }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        
    }
        
    func configureViewComponents() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 44, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 150.0, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
        infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        view.addSubview(infoView)
        infoView.anchor(top: infoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)

        //MARK: - other
        
        view.addSubview(evolutionView)
        evolutionView.anchor(top: infoView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        view.addSubview(firstEvoImageView)
        firstEvoImageView.anchor(top: evolutionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 32, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        
        view.addSubview(secondEvoImageView)
        secondEvoImageView.anchor(top: evolutionView.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 32, width: 120, height: 120)
    }
    
}

