//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    
    @State var isClicked: Bool = false
    var c: Int = 0
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        Picker("Select your cake type", selection: $order.type){
                            
                            ForEach(Order.types.indices){index in
                                Text(Order.types[index])
                             
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
                        Button("Delivery Details"){
                            print("Display delivery details....")
                            isClicked.toggle()
                                
                        }
                        .sheet(isPresented: $isClicked, content: {
                            AddressView()
                        })
                        
                    }
                 
                
                }.padding()
                .overlay(
                Rectangle()
                    .stroke(.black.opacity(0.05), lineWidth: 2)
                    .padding())
            
        }
    }
   
      
    
}
#Preview {
    ContentView()
}
