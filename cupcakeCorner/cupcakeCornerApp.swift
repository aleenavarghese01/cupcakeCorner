//
//  cupcakeCornerApp.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

@main
struct cupcakeCornerApp: App {
    @StateObject private var order = Order()
    var body: some Scene {
        WindowGroup {
            
           LoginView()
                .environment(\.managedObjectContext, order.container.viewContext)
        }
    }
}
