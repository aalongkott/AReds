//
//  Gradients.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import SwiftUI

struct GradientsHolder {
    
    enum gradient {
        case first
        case second
        case third
        
        var gradient: [Color] {
            get {
                switch self {
                case .first:
                    return [Color(red: 155/255, green: 175/255, blue: 217/255), Color(red: 16/255, green: 55/255, blue: 131/255)]
                case .second:
                    return [Color(red: 126/255, green: 242/255, blue: 157/255), Color(red: 15/255, green: 104/255, blue: 169/255)]
                case .third:
                    return [Color(red: 200/255, green: 100/255, blue: 200/255), Color(red: 19/255, green: 58/255, blue: 148/255)]
                }
            }
        }
    }
}

struct Gradients: View {
    
    var layers: GradientsHolder.gradient
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: layers.gradient), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients(layers: GradientsHolder.gradient.third)
    }
}
