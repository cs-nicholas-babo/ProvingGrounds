//
//  PokemonInteractor.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

final class PokemonInteractor: PresenterToInteractorProtocol{
    
    var presenter: InteractorToPresenterProtocol?
    var networkWorker: NetworkWorker
    
    init(worker: NetworkWorker) {
        self.networkWorker = worker
    }
    
    func fetchPokemon() {
        networkWorker.fetchPokemon { result in
            switch result{
            case .success(let pokemon):
                self.presenter?.fetchedSuccess(pokemon: pokemon)
            case .error(let _):
                self.presenter?.fetchFailed()
            }
        }
    }
    
    
}
