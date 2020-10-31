//
//  SubjectPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct SubjectPage: View {
    
    var subject: Subject
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
               
                ForEach(subject.topics, id: \.id) { topic in
                    DetailView(topic: topic)
                }
                
            }
            .navigationBarTitle(subject.text, displayMode: .inline)
        }
    }
}

struct SubjectPage_Previews: PreviewProvider {
    
    
    static var previews: some View {
        SubjectPage(subject: Subject(text: "Math", topics: [Topic(name: "Calculus", detail: "asdasdasdasdasd"), Topic(name: "Calculus", detail: "asdasdasdasdasd"), Topic(name: "Calculus", detail: "asdasdasdasdasd")]))
    }
}
