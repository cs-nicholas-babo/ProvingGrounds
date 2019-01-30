//
//  PokemonPresenter.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation
import UIKit

final class PokemonPresenter: ViewToPresenterProtocol{
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingPokemon() {
        interactor?.fetchPokemon()
    }
    
    func showDetailController(navigationController: UINavigationController) {
        router?.pushToDetailScreen(navigationConroller: navigationController)
    }
}

extension PokemonPresenter: InteractorToPresenterProtocol{
    func fetchedSuccess(pokemon: Array<Pokemon>) {
        view?.showPokemon(pokemon: pokemon)
    }
    
    func fetchFailed() {
        view?.showError()
    }
    
}
