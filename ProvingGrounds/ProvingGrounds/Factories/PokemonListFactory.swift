//
//  FactoryProtocol.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

final class PokemonListFactory{
    
    static func make() -> PokemonListController{
        let vc = PokemonListController()
        let presenter = PokemonPresenter()
        let nativeWorker = NativeNetworkWorker()
        let interactor = PokemonInteractor(worker: nativeWorker)
        
        vc.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.view = vc
        
        return vc
    }
    
}
