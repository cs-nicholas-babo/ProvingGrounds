//
//  PokemonListScreen.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListScreen: UIView{
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonListScreen{
    
    func showPokemon(pokemon: Array<Pokemon>){
        print(pokemon.count)
    }
    
}

extension PokemonListScreen: ViewCode{
    func setupViewHierarchy() {
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupAdditionalConfiguration() { }
    
    
}
