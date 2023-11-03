//
//  Order.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI
import CoreData

class Order: ObservableObject, Codable {
    
    let container = NSPersistentContainer(name: "orderData")
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Core data failed to load : \(error.localizedDescription)")
            }
        }
    }
    
    
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip, itemName, didExtraFrosting, didAddFrosting
    }
    static let types = ["vanilla", "Strawberry", "choclate", "rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false{
        didSet{
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    @Published var itemName = ""
    
    @Published var didExtraFrosting = ""
    @Published var didAddFrosting = ""
    
    
    
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        return true
    }
    var cost: Double{
        var cost = Double(quantity) * 20
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles{
            cost += Double(quantity)/2
        }
        return cost
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        try container.encode(itemName, forKey: .itemName)
        try container.encode(didExtraFrosting, forKey: .didExtraFrosting)
        try container.encode(didAddFrosting, forKey: .didAddFrosting)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
        
        
        itemName = try container.decode(String.self, forKey: .itemName)
        
        didExtraFrosting = try container.decode(String.self, forKey: .didExtraFrosting)
        didAddFrosting = try container.decode(String.self, forKey: .didAddFrosting)
        
    }
    
    func typeIdentify() {
        if (type == 0){
            itemName = "vanilla"
            
        }
        else if (type == 1){
            itemName = "Strawberry"
            
        }
        else if (type == 2){
           itemName = "choclate"
            
        }
        if (type == 3){
            itemName = "rainbow"
            
        }
    }
    func specialRequirements(){
        if extraFrosting == false{
            didExtraFrosting = " No extraFrosting"
        }
        else{
            didExtraFrosting = "extraFrosting"
        }
        if addSprinkles == false{
            didAddFrosting = " No addSprinkles"
        }
        else{
            didAddFrosting = "addSprinkles"
        }
    }
    
    
    
}
