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
    
    var body: some Scene {
        
        WindowGroup {
            if self.page == "Login" {
                LoginPage(page: $page)
            } else if self.page == "Home" {
                HomePage()
            }
            
        }
    }
}
