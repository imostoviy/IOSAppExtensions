//
//  EmojiListView.ItemView.swift
//  IOSAppExtensions
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

extension EmojiListView {
    struct ItemView: View {
        let emoji: Emoji
        
        var body: some View {
            HStack {
                Text("\(emoji.emojiString) \(emoji.name)")
                    .font(.largeTitle)
                    .padding(.vertical)
                Spacer()
            }
        }
    }
}
