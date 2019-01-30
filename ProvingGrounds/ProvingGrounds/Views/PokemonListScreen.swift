//
//  PokemonListScreen.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListScreen: UIView{
    
    lazy var collectionView: PokemonListCollectionView = {
        let view = PokemonListCollectionView()
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
    
    func showPokemon(pokemon: Array<MetaPokemon>){
        self.collectionView.updateDatasource(with: pokemon)
    }
    
}

extension PokemonListScreen: ViewCode{
    func setupViewHierarchy() {
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        collectionView.register(PokemonListCollectionViewCell.self, forCellWithReuseIdentifier: "ListCell")
        collectionView.backgroundColor = .white
    }
    
    
}
