//
//  AddressView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $order.name)
                TextField("Street Adress", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("No.", text: $order.zip)

            }
            Section{
                NavigationLink{
                    CheckoutView(order: order)
                }label: {
                    Text("Check ")
                }
            }
            
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    NavigationView{
        AddressView(order: Order())
    }
}
