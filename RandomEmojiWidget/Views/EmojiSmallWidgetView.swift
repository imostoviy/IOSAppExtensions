//
//  EmojiSmallWidgetView.swift
//  RandomEmojiWidgetExtension
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

struct EmojiSmallWidgetView: View {
    let emoji: Emoji
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emoji.emojiString)
                    .font(.system(size: 56))
                Text(emoji.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }
        }
        .widgetURL(emoji.url)
    }
}

// MARK: - Preview
struct EmojiSmallWidgetView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiSmallWidgetView(emoji: EmojiProvider.random)
    }
}
