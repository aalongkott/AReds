//
//  SearchPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct SearchPage: View {
    
    let subjectName: [String] = ["Endocrine", "Tissue Biology", "Metabolism", "Cell Biology", "Cardiovascular", "Alimentary", "Urinary"]
    
    let topics: [String: [Topic]] = [
        "Endocrine": [Topic(name: "Hypothalamus", detail: "Provided by Company", isAR: true, isFav: false), Topic(name: "Pituitary Gland", detail: "Provided by Client", isAR: true, isFav: false)],
        "Tissue Biology": [Topic(name: "Epithelium", detail: "Provided by Company", isAR: false, isFav: false), Topic(name: "Connective Tissues", detail: "Provided by Company", isAR: true, isFav: false), Topic(name: "Muscular", detail: "Provided by Company", isAR: true, isFav: false)],
        "Metabolism": [Topic(name: "Tentosephosphate Pathway", detail: "Provided by Client", isAR: false, isFav: false), Topic(name: "Uria Cycle", detail: "asdasdasdasd", isAR: false, isFav: false)],
        "Cell Biology": [Topic(name: "Cell Morphology", detail: "Provided by Client", isAR: true, isFav: false), Topic(name: "Cellular Transport", detail: "Provided by Company", isAR: false, isFav: false), Topic(name: "Epigenetics", detail: "Provided by Company", isAR: true, isFav: false)],
        "Cardiovascular": [Topic(name: "Cardiac Cycle", detail: "Provided by Company", isAR: true, isFav: false), Topic(name: "Electro Physiology", detail: "Provided by Company", isAR: false, isFav: false)],
        "Alimentary": [Topic(name: "Hepatic System", detail: "Provided by Client", isAR: false, isFav: false), Topic(name: "Gastro-endocrine", detail: "Provided by Company", isAR: true, isFav: false)],
        "Urinary": [Topic(name: "Glomerular Function", detail: "Provided by Company", isAR: false, isFav: false), Topic(name: "Tubular Function", detail: "Provided by Client", isAR: false, isFav: false), Topic(name: "Mictulition Function", detail: "Provided by Client", isAR: false, isFav: false)]
    ]
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var searchText: String  = ""
     
    @Binding var page: String
    @Binding var lastPage: String
    
    @Binding var favorites: [Topic]
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    SearchBar(text: $searchText)
                    
                    Button {
                        self.hideKeyboard()
                    } label: {
                        
                        if self.keyboard.currentHeight != 0 {
                            Text(self.searchText == "" ? "Cancel": "Done")
                        }
                            
                    }

                }
                .padding(.horizontal)
                
                List {
                    
                    ForEach(self.subjectName.filter({
                        
                        self.searchText.isEmpty ? true : $0.contains(self.searchText)
                        
                    }), id: \.self) { name in
                        
                        NavigationLink(
                            destination: SubjectPage(favorites: $favorites, page: $page, lastPage: $lastPage, subject: name, topics: self.topics[name] ?? []),
                            label: {
                                Text("\(name)")
                            })
                            
                    }
                }
                .animation(.easeOut)
                
                if self.keyboard.currentHeight == 0 {
                    HStack(spacing: 120) {
                        
                        Image(systemName: "list.bullet")
                            .font(.system(size: 28))
                        
                        Button(action: {
                            self.page = "Home"
                        }, label: {
                            Image(systemName: "house")
                                .font(.system(size: 28))
                                .foregroundColor(Color.secondary.opacity(0.3))
                        })
                        
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
                

                
            }
            .navigationBarTitle("Subjects")
            .colorScheme(.light)
            
        }
        
    }
}
