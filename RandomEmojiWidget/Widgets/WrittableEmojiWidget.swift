//
//  CustomEmojiWidget.swift
//  RandomEmojiWidgetExtension
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import SwiftUI
import WidgetKit

struct CustomEmojiWidgetProvider: IntentTimelineProvider {
    private var random: Emoji {
        EmojiProvider.random
    }
    
    func placeholder(in context: Context) -> WrittableEmojiEntry {
        WrittableEmojiEntry(date: Date(), emoji: random)
    }
    
    func getSnapshot(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (WrittableEmojiEntry) -> Void) {
        if context.isPreview {
            completion(WrittableEmojiEntry(date: Date(), emoji: random))
            return
        }
        
        let emojiDetails = lookupEmoji(for: configuration)
        let entry = WrittableEmojiEntry(date: Date(), emoji: emojiDetails)
        completion(entry)
    }
    
    func getTimeline(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (Timeline<WrittableEmojiEntry>) -> Void) {
        var entries = [WrittableEmojiEntry]()
        let emoji = lookupEmoji(for: configuration)
        let entry = WrittableEmojiEntry(date: Date(), emoji: emoji)
        entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
    
    private func lookupEmoji(for configuration: SelectEmojiIntent) -> Emoji {
        guard let emojiId = configuration.emoji?.identifier,
              let emojiForConfig = EmojiProvider.all.first(where: { $0.id == emojiId })
        else {
            return EmojiProvider.random
        }
        return emojiForConfig
    }
}

struct WrittableEmojiEntry: TimelineEntry {
    public let date: Date
    public let emoji: Emoji
}

struct WrittableEmojiWidgetEntryView : View {
    var entry: CustomEmojiWidgetProvider.Entry
    
    var body: some View {
        EmojiSmallWidgetView(emoji: entry.emoji)
    }
}

struct WrittableEmojiWidget: Widget {
    private let kind: String = "CustomEmojiWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: SelectEmojiIntent.self,
                            provider: CustomEmojiWidgetProvider()) { entry in
            WrittableEmojiWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Custom Emoji Widget")
        .description("Display a widget with an emoji of your choice.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


