//
//  FactoryProtocol.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

enum NetworkWorkerType{
    case Native
    case Alamofire
    case Moya
}

enum DatabaseWorkerType{
    case CoreData
    case Realm
}

final class PokemonListFactory{
    
    var networkProvider: NetworkWorker
//    var databaseProvider
    
    init(network: NetworkWorkerType){
        switch network{
        case .Native:
            self.networkProvider = NativeNetworkWorker()
        case .Alamofire:
            self.networkProvider = AlamoFireNetworkWorker()
        case .Moya:
            self.networkProvider = MoyaNetworkWorker()
        }
    }
    
    func make() -> PokemonListController{
        let vc = PokemonListController()
        let presenter = PokemonPresenter()
        let networkWorker = self.networkProvider
        let interactor = PokemonInteractor(worker: networkWorker)
        
        vc.presenter = presenter
        interactor.presenter = presenter

        presenter.interactor = interactor
        presenter.view = vc
        
        return vc
    }
    
}
