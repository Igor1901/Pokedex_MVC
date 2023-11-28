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
            navigationItem.title = pokemon?.name?.capitalized // с большой буквы
            imageView.image = pokemon?.image
            infoLabel.text = pokemon?.description
            infoVeiw.pokemon = pokemon
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
    
    let infoVeiw: InfoView = {
        let view = InfoView()
        view.configureViewForInfoController()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        
    }
        
    func configureViewComponents() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        
        view.addSubview(imageView)
        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 44, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 150.0, paddingLeft: 16, paddingBottom: 0, paddingRight: 4, width: 0, height: 0)
        infoLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        
        view.addSubview(infoVeiw)
        infoVeiw.anchor(top: infoLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)

        
    }
    
}

