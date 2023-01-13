//
//  EmojiData.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import Foundation

class EmojiData: ObservableObject {
    @Published var emoji: [Emoji] = [
        Emoji(name: "자동차", emoji: "🚙", date: Date.now),
        Emoji(name: "고래", emoji: "🐳", date: Date.now),
        Emoji(name: "별", emoji: "⭐️", date: Date.now)
    ]
}

struct Emoji: Identifiable {
    var id: UUID = UUID()
    
    var name: String
    var emoji: String
    var date: Date
}

