//
//  Topic.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import Foundation

struct Topic: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var detail: String
    var isAR: Bool
    var isFav: Bool
}
