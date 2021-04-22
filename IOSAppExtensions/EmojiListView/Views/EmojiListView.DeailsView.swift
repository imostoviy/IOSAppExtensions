//
//  EmojiListView.DeailsView.swift
//  IOSAppExtensions
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

extension EmojiListView {
    struct DetailsView: View {
        let emoji: Emoji
        
        var body: some View {
            ZStack {
                Color(UIColor.systemIndigo).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("\(emoji.emojiString) \(emoji.name)")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Text(emoji.description)
                        .padding([.horizontal, .bottom])
                        .font(.title)
                }
                .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Preview

struct EmojiDetailsView_preview: PreviewProvider {
    static var previews: some View {
        EmojiListView.DetailsView(emoji: EmojiProvider().all[1])
    }
}
