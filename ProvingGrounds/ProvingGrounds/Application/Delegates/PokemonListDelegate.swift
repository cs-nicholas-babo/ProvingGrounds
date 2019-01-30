//
//  PokemonListDelegate.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListDelegate: NSObject, UICollectionViewDelegate{
    
}

extension PokemonListDelegate: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing:CGFloat = 16.0
        let numberOfItemsPerRow:CGFloat = 2
        let phoneWidth = UIScreen.main.bounds.width
        
        let totalSpacing = (spacing * CGFloat(numberOfItemsPerRow + 1))
        let cellWidth = (phoneWidth - totalSpacing)/numberOfItemsPerRow
        
        return CGSize(width: cellWidth, height: PokemonListCollectionViewCell.height(for: cellWidth))
    }
    
}
