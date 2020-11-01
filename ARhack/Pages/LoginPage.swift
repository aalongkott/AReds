//
//  LoginPage.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct LoginPage: View {
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @State private var isAlert: Bool = false
    
    @Binding var page: String
    
    var body: some View {
        
        ZStack {
            
            Color.white
            
            VStack(spacing: 15) {
                
                VStack(spacing: 20) {
                        
                    Text("AReds")
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
                        .keyboardType(.numberPad)
                    
                    
                }
                .frame(width: 320, height: 170, alignment: .center)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
                Button(action: {
                    
                    if self.userName == "Devdisrupt" && self.password == "1234" {
                        
                        self.page = "Home"
                        
                    } else {
                        self.isAlert.toggle()
                    }
                    
                    
                }, label: {
                    Text("Login")
                        .frame(width: 330, height: 30, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .background(Color.black)
                        .cornerRadius(20)
                        .shadow(radius: 15)
                })
            }
            .padding(.bottom, keyboard.currentHeight)
            .animation(.easeOut)
            .colorScheme(.light)
            .alert(isPresented: $isAlert, content: {
                Alert(title: Text("AReds"), message: Text("Wrong username or password"), dismissButton: .default(Text("OK")))
            })
            
        }
        .ignoresSafeArea(.all)
        .onTapGesture {
            self.hideKeyboard()
        }
        
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage(page: .constant("Hello"))
    }
}
