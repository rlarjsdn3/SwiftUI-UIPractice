//
//  __EmojiApp.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import SwiftUI

@main
struct __EmojiApp: App {
    //@StateObject var EmojiData: EmojiData = EmojiData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EmojiData())
        }
    }
}
