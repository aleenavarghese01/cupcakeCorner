//
//  LoginView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var order = Order()
    @State var name = ""
    @State private var email = ""
    @State var isClicked: Bool = false
    
    
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{
                    TextField("Username : ", text: $order.name)
                    TextField("Email : ", text:$email)
                }
                
                Section{
                    Button("Create account"){
                        print("Create account....")
                        isClicked.toggle()
                    }
                    .sheet(isPresented: $isClicked, content: {
                        ContentView()
                    })
                }
//                .disabled(disableForm)
            }
            .navigationBarTitle("Sign Up")
        }
    }
    var disableForm: Bool{
        name.count < 1 || email.count < 1
    }
}

//#Preview {
//    LoginView(order: Order())
//}
