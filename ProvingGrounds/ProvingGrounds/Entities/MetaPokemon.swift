//
//  MetaPokemon.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 30/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

struct MetaPokemon{
    
    var name:String
    var url: String
    
    init(name:String, url:String) {
        self.name = name
        self.url = url
    }
}

extension MetaPokemon: Codable{
    
    enum CodingKeys:String, CodingKey{
        case name
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.url, forKey: .url)
    }
    
}
