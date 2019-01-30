//
//  PokemonListCollectionViewCell.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit
import SnapKit

final class PokemonListCollectionViewCell: UICollectionViewCell{
    
    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
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

extension PokemonListCollectionViewCell{
    
    func setup(for pokemon: MetaPokemon){
        self.titleLabel.text = pokemon.name.capitalized
    }
    
    static func height(for width: CGFloat) -> CGFloat{
        return (1/2) * width
    }
    
    func cornerRadiusForCurrentDevice() -> CGFloat{
        let xWidth:CGFloat = 414
        let xRadius:CGFloat = 18
        
        return (xRadius * UIScreen.main.bounds.width)/xWidth
    }
    
    func setupCornerRadius(){
        self.layer.cornerRadius = cornerRadiusForCurrentDevice()
    }
    
    func setupShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadiusForCurrentDevice()).cgPath
    }
    
}

extension PokemonListCollectionViewCell: ViewCode{
    
    func setupViewHierarchy() {
        self.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        self.titleLabel.textAlignment = .center
        self.titleLabel.contentMode = .center
        self.backgroundColor = .red
        
        setupCornerRadius()
        setupShadow()
    }
}
