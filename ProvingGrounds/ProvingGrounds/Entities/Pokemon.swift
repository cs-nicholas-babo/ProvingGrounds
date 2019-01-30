//
//  Pokemon.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

public struct Pokemon{
    
    var id: Int
    var name: String
    
    init(id:Int, name:String){
        self.id = id
        self.name = name
    }
}

extension Pokemon: Hashable{
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    public var hashValue: Int {
        return self.id.hashValue
    }
}

extension Pokemon: Codable{
    
    enum CodingKeys:String, CodingKey{
        case id
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
    
}
