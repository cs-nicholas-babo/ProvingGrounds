//
//  PokemonListCollectionView.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListCollectionView: UICollectionView{
    
    fileprivate var pokemonDatasource: PokemonListDataSource?
    fileprivate var pokemonDelegate: PokemonListDelegate?
    
    convenience init() {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        let delegate = PokemonListDelegate()
        self.pokemonDelegate = delegate
        self.pokemonDatasource = PokemonListDataSource(pokemon: [], collectionView: self, delegate: delegate)
        setupLayout()
    }
    
    func setupLayout(){
        let spacing:CGFloat = 16.0
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionViewLayout = layout
    }
    
    func updateDatasource(with pokemon: [MetaPokemon]){
        self.pokemonDatasource?.update(with: pokemon)
    }
    
}
