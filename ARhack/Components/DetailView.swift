//
//  DetailView.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct DetailView: View {
    
    var color: GradientsHolder.gradient
    
    var topic: Topic
    
    @Binding var favorites: [Topic]
    
    @State private var isAdd: Bool = false
    
    @State private var successAdd: Bool = false
    
    @Binding var page: String
    @Binding var lastPage: String
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Button(action: {
                        
                        if topic.isFav {
                            
                            for (index, top) in self.favorites.enumerated() {
                                if top.name == topic.name {
                                    self.favorites.remove(at: index)
                                }
                            }
                            
                        } else {
                            
                        
                            for (_, top) in self.favorites.enumerated() {
                                if top.name == topic.name {
                                    self.isAdd = true
                                    return
                                }
                            }
                            
                            self.favorites.append(Topic(name: topic.name, detail: topic.detail, isAR: topic.isAR, isFav: true))
                            
                            self.successAdd = true
                            
                            print(self.favorites)
                        }
                        
                        
                    }, label: {
                        Image(systemName: topic.isFav ? "minus.circle":"plus.circle")
                            .foregroundColor(Color.white)
                    })
                    .animation(.easeOut)
                    
                    
                    Text(topic.name)
                        .bold()
                }
                
                
                Spacer()
                
                Text(topic.detail)
                    
                
            }
            .padding(20)
            .alert(isPresented: $successAdd, content: {
                Alert(title: Text("AReds"), message: Text("Add to favorite"), dismissButton: .default(Text("OK")))
            })
            
            Spacer()
            
            Image(systemName: topic.isAR ? "arkit": "view.3d")
                .font(.system(size: 30))
                .frame(width:50, height: 50, alignment: .center)
                .background(Color.white.opacity(0.7))
                .cornerRadius(15)
                .padding(.trailing, 20)
                .padding(.top, 25)
                .onTapGesture(count: 1, perform: {
                    
                    if topic.isAR {
                        if let url = URL(string: "openar://") {
                            //                            UIApplication.shared.canOpenURL(url)
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            
                        }
                        
                    } else {
                        
                        self.lastPage = self.page
                        
                        self.page = "3D"
                        
                    }
                    
                    
                })
                .alert(isPresented: $isAdd, content: {
                    Alert(title: Text("AReds"), message: Text("Item has been added to your favorite"), dismissButton: .default(Text("OK")))
                })
            
        }
        .shadow(radius: 10)
        .frame(width: 340, height: 100, alignment: .center)
        .background(Gradients(layers: color))
        .cornerRadius(15)
        .cornerRadius(15)
        
        
    }
}
