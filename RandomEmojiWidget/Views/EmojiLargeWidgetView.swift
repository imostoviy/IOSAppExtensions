//
//  EmojiLargeWidgetView.swift
//  RandomEmojiWidgetExtension
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

struct EmojiLargeWidgetView: View {
    let emoji: Emoji
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emoji.name)
                    .bold()
                    .font(.title)
                Text(emoji.emojiString)
                    .font(.system(size: 60))
                    .padding()
                Text(emoji.description)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}
