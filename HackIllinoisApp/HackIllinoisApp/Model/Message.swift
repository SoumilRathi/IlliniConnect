//
//  Message.swift
//  HackIllinoisApp
//
//  Created by Manish Rathi on 24/02/24.
//

import Foundation


struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
