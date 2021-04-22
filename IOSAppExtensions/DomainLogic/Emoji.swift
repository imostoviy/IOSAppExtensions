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
}

// MARK: - Extension Identifiable
extension Emoji: Identifiable {
    var id: String {
        UUID().uuidString
    }
}
