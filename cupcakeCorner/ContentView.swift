//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type){
                        
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value:
                                $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    }
                label:{
                    Text("delivery details")
                }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
}
#Preview {
    ContentView()
}
