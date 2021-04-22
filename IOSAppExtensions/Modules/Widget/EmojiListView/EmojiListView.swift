//
//  EmojiListView.swift
//  IOSAppExtensions
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI

struct EmojiListView: View {
    private let emojies = EmojiProvider().all
    
    var body: some View {
        NavigationView {
            List(emojies) { emoji in
                NavigationLink(destination: DetailsView(emoji: emoji)) {
                    ItemView(emoji: emoji)
                }
            }
            .navigationTitle("Emoji book")
        }
        .accentColor(.white)
    }
}

struct EmojiListView_Preview: PreviewProvider {
    static var previews: some View {
        EmojiListView()
    }
}
