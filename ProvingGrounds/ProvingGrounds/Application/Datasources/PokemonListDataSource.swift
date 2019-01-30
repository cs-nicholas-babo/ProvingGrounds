//
//  PokemonListDataSource.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListDataSource: NSObject, UICollectionViewDataSource{
    
    private var pokemon: [MetaPokemon]
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    
    init(pokemon: [MetaPokemon], collectionView: UICollectionView, delegate: UICollectionViewDelegate) {
        self.pokemon = pokemon
        self.collectionView = collectionView
        self.delegate = delegate
        super.init()
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = delegate
        self.collectionView?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! PokemonListCollectionViewCell
        
        cell.setup(for: pokemon[indexPath.item])
        
        return cell
    }
    
    func update(with pokemon: [MetaPokemon]){
        self.pokemon = pokemon
        self.collectionView?.reloadData()
    }
}

