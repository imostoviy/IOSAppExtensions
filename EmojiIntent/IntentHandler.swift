//
//  IntentHandler.swift
//  EmojiIntent
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import Intents

class IntentHandler: INExtension, SelectEmojiIntentHandling {
    override func handler(for intent: INIntent) -> Any {
        return self
    }
    
    func provideEmojiOptionsCollection(
        for intent: SelectEmojiIntent,
        with completion: @escaping (INObjectCollection<EmojiInObject>?, Error?) -> Void
    ) {
        let emojiItems = EmojiProvider
            .all
            .map {
                EmojiInObject(identifier: $0.id,
                              display: "\($0.emojiString) \($0.name)")
            }
        completion(INObjectCollection(items: emojiItems), nil)
    }
}
