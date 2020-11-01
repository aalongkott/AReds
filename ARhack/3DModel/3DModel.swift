//
//  3DModel.swift
//  ARhack
//
//  Created by alongkot on 1/11/2563 BE.
//


import SwiftUI
import SceneKit

struct EarthModel: View {
    
    @Binding var page: String
    
    @Binding var lastPage: String
    
    let texts: [String: String] = ["Search": "Subject", "Favorite": "Favorites"]
    
    var body: some View {
        
        NavigationView {
            
        
            VStack(alignment: .leading) {
                
                
                Button {

                    self.page = lastPage

                } label: {
                    
                    HStack(spacing: 5) {
                        
                        Image(systemName: "chevron.left")
                            .font(.headline)
                        
                        Text("\(texts[lastPage] ?? "")")
                        
                        
                    }
                    .padding(.leading, 20)
                    
                }
                

                
                SceneView(scene: SCNScene(named: "Heart.usdz"), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
                
                Spacer()
                
                
            }
            .navigationBarTitle("3D Model")
            .padding(.top, 20)
            .animation(.easeIn)
            
            
        }
        
        
    }
}
