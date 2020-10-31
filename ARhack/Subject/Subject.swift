//
//  Subject.swift
//  ARhack
//
//  Created by alongkot on 31/10/2563 BE.
//

import Foundation

struct Subject: Identifiable {
    
    var id: UUID = UUID()
    var text: String
    var topics: [Topic]

}
