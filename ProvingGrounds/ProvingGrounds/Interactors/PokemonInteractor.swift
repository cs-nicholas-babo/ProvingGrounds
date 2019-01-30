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
        self.networkWorker.fetchPokemon()
    }
    
    
}
