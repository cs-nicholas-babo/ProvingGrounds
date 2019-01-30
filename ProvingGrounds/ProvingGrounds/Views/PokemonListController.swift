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
    
    override func loadView() {
        self.view = self.screen
    }
}

extension PokemonListController: PresenterToViewProtocol{
    
    func showPokemon(pokemon: Array<MetaPokemon>) {
        screen.showPokemon(pokemon: pokemon)
    }
    
    func showError() {
        print("View controller showing error")
    }
    
}
