//
//  CheckoutView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 02/11/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    var body: some View {
        ScrollView{
            VStack{
                //                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),scale: 3){ image in
                //                    image
                //                        .resizable()
                //                        .scaledToFit()
                //
                //
                //                } placeholder:{
                //                    ProgressView()
                //                }
                //                .frame(height: 233)
                
                Text("your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                    .padding(.vertical, 100)
                
                Button("place Order") {
                    Task{
                        await placeOrder()
                    }
                }
            }
        }
        .navigationTitle("check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("thank you",isPresented: $showingConfirmation){
            Button("ok") {}
        } message: {
            Text(confirmationMessage)
        }
        
        
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodeOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "\nyour order for \(decodeOrder.quantity) x \(Order.types[decodeOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        }catch {
            print("checkout failed")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
