//
//  LoginPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct LoginPage: View {
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @Binding var page: String
    
    var body: some View {
        
        ZStack {
            
            Color.white
            
            VStack(spacing: 25) {
                
                VStack(spacing: 20) {
                    
                    Text("AR Education")
                        .font(.system(size: 36))
                        .bold()
                    
                    TextField("username", text: $userName)
                        .frame(width: 300, height: 30)
                        .overlay(Capsule()
                                    .stroke(Color.secondary, lineWidth: 1)
                                    .frame(width: 320, height: 30))
                        
                    
                    SecureField("password", text: $password)
                        .frame(width: 300, height: 30)
                        .overlay(Capsule()
                                    .stroke(Color.secondary, lineWidth: 1)
                                    .frame(width: 320, height: 30))
                    
                    
                }
                .frame(width: 320, height: 170, alignment: .center)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
                Button(action: {
                    
                    if self.userName == "Hackmaster" && self.password == "1234" {
                        
                        self.page = "Home"
                        
                    } else {
                        print("wrong username or password")
                    }
                    
                    
                }, label: {
                    Text("Login")
                        .frame(width: 330, height: 30, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(20)
                        .shadow(radius: 15)
                })
            }
            
            
            
            
        }
        .ignoresSafeArea(.all)
        
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(page: .constant("Hello"))
    }
}
