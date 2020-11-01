//
//  FavoritePage.swift
//  ARhack
//
//  Created by alongkot on 1/11/2563 BE.
//

import SwiftUI

struct FavoritePage: View {
    let colors: [Int: GradientsHolder.gradient] = [
        
        0: GradientsHolder.gradient.first,
        1: GradientsHolder.gradient.second,
        2: GradientsHolder.gradient.third
        
    ]
    
    @Binding var page: String
    @Binding var lastPage: String
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @Binding var favorites: [Topic]
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                ScrollView {
                    
                    if self.favorites.count != 0 {
                    
                        ForEach(self.favorites, id: \.id) { topic in
                            
                            DetailView(color: colors[Int.random(in: 1...10) % 3] ?? GradientsHolder.gradient.second, topic: topic, favorites: $favorites, page: $page, lastPage: $lastPage)
                                
                        }
                        
                    } else {
                        Text("There is no favorite yet")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.top, 150)
                    }
                }
                
                
                if self.keyboard.currentHeight == 0 {
                    HStack(spacing: 120) {
                        
                        Button(action: {
                            self.page = "Search"
                        }, label: {
                            Image(systemName: "list.bullet")
                                .font(.system(size: 28))
                                .foregroundColor(Color.secondary.opacity(0.3))
                        })
                        
                        Button(action: {
                            self.page = "Home"
                        }, label: {
                            Image(systemName: "house")
                                .font(.system(size: 28))
                                .foregroundColor(Color.secondary.opacity(0.3))
                        })
                        
                        Image(systemName: "star.fill")
                            .font(.system(size: 28))
                            
                        
                    }
                    .padding(.vertical)
                }
                
                
                
            }
            .navigationBarTitle("Favorites")
            .colorScheme(.light)
            
        }
            
    }
        
        
}
