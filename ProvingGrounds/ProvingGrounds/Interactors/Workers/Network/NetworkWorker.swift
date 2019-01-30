//
//  NetworkWorker.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(Error)
}

protocol NetworkWorker: class{
    var baseURL:String {get}
    func fetchPokemon(callback: @escaping (Result<[MetaPokemon]>) -> Void)
}

extension NetworkWorker{
    var baseURL: String{
        get{
            return "https://pokeapi.co/api/v2"
        }
    }
}

