//
//  DetailView.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct DetailView: View {
    
    var topic: Topic
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .center) {
                Text(topic.name)
                Text(topic.detail)
            }
            .padding(20)
            
            Spacer()
        }
        .frame(width: 380, height: 100, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, lineWidth: 1)
                    .frame(width: 380, height: 100))
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(topic: Topic(name: "Test", detail: "some detail"))
    }
}
