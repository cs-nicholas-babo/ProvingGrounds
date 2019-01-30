//
//  MoyaNetworkWorker.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Moya

enum PokemonAPI{
    case fetch(offset: Int, limit: Int)
    case fetchQueried(query: String)
}

extension PokemonAPI: TargetType{
    var baseURL: URL {
        guard let url = URL(string: "https://pokeapi.co/api/v2") else { fatalError("Error: Base URL could not be configured")}
        return url
    }
    
    var path: String {
        switch self{
            case .fetch(_, _): return "pokemon"
            case .fetchQueried(let query): return "pokemon/\(query)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self{
        case .fetch(let offset, let limit): return .requestParameters(parameters: ["offset": offset, "limit":limit], encoding: URLEncoding.queryString)
        case .fetchQueried(_): return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}

final class MoyaNetworkWorker: NetworkWorker{
    var provider = MoyaProvider<PokemonAPI>()
    
    func fetchPokemon(callback: @escaping (Result<[MetaPokemon]>) -> Void) {
        provider.request(.fetch(offset: 0, limit: 151)) { result in
            switch result{
            case .success(let response):
                do{
                    let decoder = JSONDecoder()
                    let responseObj = try decoder.decode(PokemonResponse.self, from: response.data)
                    callback(.success(responseObj.results))
                }catch{
                    callback(.error(NSError()))
                }
            case .failure(let error):
                print(error.errorDescription ?? "Moya Error")
                callback(.error(error))
            }
        }
    }
}
