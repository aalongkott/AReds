//
//  HomePage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct HomePage: View {
    
    let images = ["img1", "img2", "img3"]
    
    @Binding var page: String
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Image(systemName: "power")
                        .font(.system(size: 20))
                        .onTapGesture {
                            self.page = "Login"
                        }
                    
                }
                .padding()
                
                
                ScrollView {
                    
                    ForEach(images, id: \.self) { img in
                        
                        Image(img)
                            .resizable()
                            .frame(width: 340, height: 165, alignment: .center)
                            .cornerRadius(15)
                            .padding(.bottom, 20)
                            .animation(.linear)
                        
                    }
                    
                }
                
                Spacer()
                
                HStack(spacing: 120) {
                    
                    Button(action: {
                        self.page = "Search"
                    }, label: {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 28))
                            .foregroundColor(Color.secondary.opacity(0.3))
                    })
                    
                    Image(systemName: "house.fill")
                        .font(.system(size: 28))
                    
                    
                    Button(action: {
                        self.page = "Favorite"
                    }, label: {
                        Image(systemName: "star")
                            .font(.system(size: 28))
                            .foregroundColor(Color.secondary.opacity(0.3))
                    })
                }
                .padding(.vertical)
                
                
            }
            .navigationBarTitle("AR Education")
            .colorScheme(.light)
        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(page: .constant("Home"))
    }
}
