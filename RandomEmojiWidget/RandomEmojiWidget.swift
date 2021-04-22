//
//  RandomEmojiWidget.swift
//  RandomEmojiWidget
//
//  Created by Ihor Mostovyi on 22.04.2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    private var random: Emoji {
        EmojiProvider().random
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: random)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: random)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: random)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: Emoji
}

struct RandomEmojiWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            EmojiSmallWidgetView(emoji: entry.emoji)
        case .systemMedium:
            EmojiMediumWidgetView(emoji: entry.emoji)
        case .systemLarge:
            EmojiLargeWidgetView(emoji: entry.emoji)
        @unknown default:
            EmptyView()
        }
    }
}

@main
struct RandomEmojiWidget: Widget {
    let kind: String = "RandomEmojiWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            RandomEmojiWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Random emojii")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct RandomEmojiWidget_Previews: PreviewProvider {
    static var previews: some View {
        RandomEmojiWidgetEntryView(entry: SimpleEntry(date: Date(), emoji: EmojiProvider().random))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
