//
//  Emoji.swift
//  IOSAppExtensions
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import Foundation

struct Emoji {
    let emojiString: String
    let name: String
    let description: String
    let url: URL?
    
    init(emojiString: String, name: String, description: String) {
        self.emojiString = emojiString
        self.name = name
        self.description = description
        self.url = URL(string: "emoji://\(name.filter { !$0.isWhitespace })")
    }
    
    
}

// MARK: - Extension Identifiable
extension Emoji: Identifiable {
    var id: String {
        emojiString
    }
}
