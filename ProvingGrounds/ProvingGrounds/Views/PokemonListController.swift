//
//  PokemonListController.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import UIKit

final class PokemonListController: UIViewController{
    
    var presenter: ViewToPresenterProtocol?
    var screen = PokemonListScreen()
    
    override func viewDidLoad() {
        presenter?.startFetchingPokemon()
    }
}

extension PokemonListController: PresenterToViewProtocol{
    
    func showPokemon(pokemon: Array<Pokemon>) {
        
    }
    
    func showError() {
        
    }
    
}
