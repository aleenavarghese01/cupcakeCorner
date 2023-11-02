//
//  AsyncImage.swift
//  cupcakeCorner
//
//  Created by Aleena Varghese on 01/11/23.
//

import SwiftUI

struct AsyncImage: View {
        
        private let photoURL = URL(string: "")
        private let noPhotoURL = URL(string: "")
        
        var body: some View {
            
            GeometryReader { geometry in
                Text("Async Image")
                    .font(.system(size: 40))
                    .padding(.horizontal, 50)
                
                
            }
        }
    }

#Preview {
    AsyncImage()
}
