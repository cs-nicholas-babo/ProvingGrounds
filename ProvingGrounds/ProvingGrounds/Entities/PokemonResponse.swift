//
//  PokemonResponse.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

struct PokemonResponse{
    
    var results: [MetaPokemon]
    
    init(results: [MetaPokemon]) {
        self.results = results
    }
    
}

extension PokemonResponse: Codable{
    
    enum CodingKeys:String, CodingKey{
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([MetaPokemon].self, forKey: .results)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.results, forKey: .results)
    }
    
}
