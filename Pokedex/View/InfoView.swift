//
//  InfoView.swift
//  Pokedex
//
//  Created by Игорь Пачкин on 22/11/23.
//

import UIKit

protocol InfoViewDelegate {
    func dismissInfoView(withPokemon pokemon: Pokemon?)
}

class InfoView: UIView {
    
    let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let defenseLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let pokedexIdLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let attackLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        configureLabel(label: typeLabel, title: "Type", details: "type")
        configureLabel(label: defenseLabel, title: "Defense", details: "49")
        configureLabel(label: heightLabel, title: "Height", details: "7")
        configureLabel(label: weightLabel, title: "Weight", details: "69")
        configureLabel(label: pokedexIdLabel, title: "Pokedex Id", details: "3")
        configureLabel(label: attackLabel, title: "Base Attack", details: "55")
    }
    
    func configureLabel(label: UILabel, title: String, details: String ){
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title): ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.mainPink()]))
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        label.attributedText = attributedText
        
    }
    
    func configureViewForInfoController() { // нужные ебучие данные на 2 экране
        addSubview(typeLabel)
        typeLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGroupedBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
}
