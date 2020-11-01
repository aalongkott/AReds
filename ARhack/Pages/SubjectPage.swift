//
//  SubjectPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct SubjectPage: View {
    
    let colors: [Int: GradientsHolder.gradient] = [
        
        0: GradientsHolder.gradient.first,
        1: GradientsHolder.gradient.second,
        2: GradientsHolder.gradient.third
        
    ]
    
    @Binding var favorites: [Topic]
    
    @Binding var page: String
    
    @Binding var lastPage: String
    
    var subject: String
    
    var topics: [Topic]
    
    var body: some View {
        
            
        ScrollView {
           
            ForEach(self.topics, id: \.id) { topic in
                
                DetailView(color: colors[Int.random(in: 1...10) % 3] ?? GradientsHolder.gradient.second, topic: topic, favorites: $favorites, page: $page, lastPage: $lastPage)
                    
                
            }
            .padding(.top, 20)
            
        }
        .navigationBarTitle(subject, displayMode: .inline)
        .colorScheme(.light)
        
    }
}
