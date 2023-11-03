//
//  OrderDetails.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 03/11/23.
//

import SwiftUI

struct OrderDetails: View {
    
    @StateObject var order = Order()
    @State var isClicked = false
    
    @Environment(\.managedObjectContext) var moc
    
//    @FetchRequest(
//        entity: OrderEntity.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \OrderEntity.name, ascending: true)]) var orders: FetchedResults<OrderEntity>
    
    var body: some View {
        NavigationView{
            Form{
                Text("Name  :  \(order.name)")
                Text("Street Address  :   \(order.streetAddress)")
                Text("City  :  \(order.city)")
                Text("No.  :  \(order.zip)")
                Text("Item.  :  \(order.itemName)")
                Text("Special requirements.  : \t \n \t \(order.didAddFrosting) \t \n \t \(order.didExtraFrosting)")
                Text("Cost  :  \(order.cost, format: .currency(code: "USD"))")
                
//                Button("add"){
//                    let newOrder = OrderEntity(context: moc)
//                    newOrder.name = order.name
//                    newOrder.streetAddress = order.streetAddress
//                    newOrder.city = order.city
//                    newOrder.zip = order.zip
//                    newOrder.itemName = order.itemName
//                    newOrder.didAddFrosting = order.didAddFrosting
//                    newOrder.didExtraFrosting = order.didExtraFrosting
//                    newOrder.type = Int16(order.type)
//                    newOrder.extraFrosting = order.extraFrosting
//                    newOrder.addSprinkles = order.addSprinkles
//                    
//                    do {
//                        try moc.save()
//                    } catch {
//                        print("Error saving order: \(error)")
//                    }
//                }
               
                
                
            }.navigationTitle("Welcome \(order.name) ...... ")
        }
        
    }
    
    
}

#Preview {
    OrderDetails()
}
