//
//  EmojiWidgetBundle.swift
//  RandomEmojiWidgetExtension
//
//  Created by Ihor Mostovyi on 23.04.2021.
//

import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {

  @WidgetBundleBuilder
  var body: some Widget {
    RandomEmojiWidget()
    WrittableEmojiWidget()
  }
}
