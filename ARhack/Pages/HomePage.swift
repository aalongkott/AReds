//
//  HomePage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct HomePage: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .font(.system(size: 28))
                    
                }
                .padding()
                
                Text("Hello")
                
                Spacer()
                
                HStack(spacing: 120) {
                    
                    Image(systemName: "house")
                        .font(.system(size: 28))
                    
                    Image(systemName: "list.bullet")
                        .font(.system(size: 28))
                    
                    Image(systemName: "star")
                        .font(.system(size: 28))
                }
                
                
            }
            .navigationBarTitle("AR Education")
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
