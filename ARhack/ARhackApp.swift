//
//  ARhackApp.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

@main
struct ARhackApp: App {
    
    @State private var page = "Login"
    
    @State private var lastPage = ""
    
    @State private var favoriteTopics: [Topic] = []
    
    var body: some Scene {
        
        WindowGroup {
            
            if self.page == "Login" {
                LoginPage(page: $page)
                    .transition(.slide)

            } else if self.page == "Home" {
                HomePage(page: $page)
                    .transition(.slide)

            } else if self.page == "Search" {
                SearchPage(page: $page, lastPage: $lastPage, favorites: $favoriteTopics)
                    .transition(.slide)

            } else if self.page == "Favorite" {
                FavoritePage(page: $page, lastPage: $lastPage, favorites: $favoriteTopics)
                    .transition(.slide)

            } else if self.page == "3D" {
                EarthModel(page: $page, lastPage: $lastPage)

            }
        }

    }
}

//struct CustomController: UIViewControllerRepresentable {
//    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomController>) -> UIViewController {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//        let controller = storyboard.instantiateViewController(identifier: "ARBuild")
//
//        return controller
//
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CustomController>) {
//
//    }
//}
