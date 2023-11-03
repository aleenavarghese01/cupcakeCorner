//
//  AddressView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order = Order()
    @State var isClicked: Bool = false
    var body: some View {
        Form{
            Section {
                HStack {
                    Text("Name : " )
                    TextField("", text: $order.name)
                }
                HStack {
                    Text("Street Adress : " )
                    TextField("", text: $order.streetAddress)
                }
                HStack {
                    Text("City : " )
                    TextField("", text: $order.city)
                }
                HStack {
                    Text("No. : ")
                    TextField("", text: $order.zip)
                }

            }
            Button("CheckOut"){
                isClicked.toggle()
            }
            .sheet(isPresented: $isClicked, content: {
                CheckoutView(order: order)
            })
            
//            .disabled(order.hasValidAddress == false)
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
