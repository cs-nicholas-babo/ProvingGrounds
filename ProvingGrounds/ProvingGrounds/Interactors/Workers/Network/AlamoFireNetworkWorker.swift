//
//  AlamoFireNetworkWorker.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation
import Alamofire

final class AlamoFireNetworkWorker: NetworkWorker{
    
    func fetchPokemon(callback: @escaping (Result<[MetaPokemon]>) -> Void) {
        var components = URLComponents(string: baseURL + API.fetchFirstGen)
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "limit", value: "151")
        ]
        
        components?.queryItems = queryItems
        guard let url = components?.url else{
            callback(.error(NSError()))
            return
        }
        
        Alamofire.request(url).validate().responseJSON { (result) in
            let decoder = JSONDecoder()
            guard let data = result.data else{
                callback(.error(NSError()))
                return
            }
            do{
                let responseObj = try decoder.decode(PokemonResponse.self, from: data)
                callback(.success(responseObj.results))
            }catch{
                callback(.error(NSError()))
            }
            
        }
        
    }
    
}
