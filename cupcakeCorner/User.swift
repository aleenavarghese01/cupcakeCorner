//
//  User.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import Foundation
class User: ObservableObject, Codable{
    enum CodingKeys: CodingKey{
        case name
    }
    @Published var name = "Aleena"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
}
