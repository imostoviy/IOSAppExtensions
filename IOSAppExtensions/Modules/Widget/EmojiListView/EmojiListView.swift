//
//  EmojiListView.swift
//  IOSAppExtensions
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

struct EmojiListView: View {
    private let emojies = EmojiProvider().all
    @State private var selectedEmoji: Emoji?
    
    var body: some View {
        List(emojies) { emoji in
            Button {
                selectedEmoji = emoji
            } label: {
                ItemView(emoji: emoji)
            }
        }
        .sheet(item: $selectedEmoji, content: DetailsView.init(emoji:))
        .onOpenURL(perform: openedWith)
    }
    
    private func openedWith(_ url: URL) {
        guard let emoji = emojies.first(where: { $0.url == url }) else {
            return
        }
        selectedEmoji = emoji
    }
}

struct EmojiListView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiListView()
    }
}
