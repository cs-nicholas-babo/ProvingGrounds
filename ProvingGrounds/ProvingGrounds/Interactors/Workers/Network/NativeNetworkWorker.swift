//
//  NativeNetworkWorker.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

enum APIRequest: String{
    case fetchFirstGen = "/pokemon&limit=151"
    case fetchTypes = "/types"
}

struct API{
    
    static var fetchFirstGen:String {
        return "/pokemon"
    }
    
}

class NativeNetworkWorker: NetworkWorker{
    
    func fetchPokemon(callback: @escaping (Result<[MetaPokemon]>) -> Void){
        var components = URLComponents(string: baseURL + API.fetchFirstGen)
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "151")
        ]
        
        components?.queryItems = queryItems
        guard let url = components?.url else{
            callback(.error(NSError()))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else{
                callback(.error(NSError()))
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let responseObj = try decoder.decode(PokemonResponse.self, from: data)
                DispatchQueue.main.async {
                    callback(.success(responseObj.results))
                }
            }catch{
                callback(.error(NSError()))
            }
        }
        task.resume()
    }
    
}
