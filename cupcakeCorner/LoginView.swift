//
//  LoginView.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var email = ""
    @State var isClicked: Bool = false
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                
                Section{
                    Button("Create account"){
                        print("Create account....")
                        isClicked = true
                    }
                }
                .disabled(disableForm)
                Section{
                    NavigationLink{
                        ContentView()
                    }
                label:{
                    Text("order cupcakes")
                }
                }
            }
            .navigationBarTitle("Sign Up")
        }
    }
    var disableForm: Bool{
        username.count < 5 || email.count < 5
    }
}

#Preview {
    LoginView()
}
