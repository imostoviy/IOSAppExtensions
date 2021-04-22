//
//  EmojiMediumWidgetView.swift
//  RandomEmojiWidgetExtension
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

struct EmojiMediumWidgetView: View {
    let emoji: Emoji
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            HStack {
                pictureLabel
                descriptionView
            }
            .padding()
        }
    }
    
    private var pictureLabel: some View {
        Text(emoji.emojiString)
            .font(.system(size: 46))
            .padding()
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading) {
            Text(emoji.name)
                .font(.headline)
            Text(emoji.description)
        }
        .foregroundColor(.white)
        .padding(.vertical)
    }
}
