//
//  SearchPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct SearchPage: View {
    
    let subjectName: [String] = ["Chemistry", "Math", "Physics", "Biology", "History", "English", "Arts"]
    
    @State private var searchText: String  = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                SearchBar(text: $searchText)
                
                List {
                    
                    ForEach(self.subjectName.filter({
                        
                        self.searchText.isEmpty ? true : $0.contains(self.searchText)
                        
                    }), id: \.self) { name in
                        
                        NavigationLink(
                            destination: SubjectPage(subject: Subject(text: name, topics: [])),
                            label: {
                                Text("\(name)")
                            })
                            
                    }
                }
                .animation(.easeOut)

                
            }
            .navigationBarTitle("Subjects")
        }
        
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
