//
//  EmojiRow.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import SwiftUI

struct EmojiRow: View {
    var emoji: Emoji
    var dateFormatter: DateFormatter {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD HH:mm"
        return formatter
    }
    
    var body: some View {
        HStack {
            Text(emoji.emoji)
                .font(.largeTitle)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(emoji.name)
                    .font(.headline)
                Text("\(emoji.date, formatter: dateFormatter)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding([.top, .bottom], 8)
        .padding([.leading, .trailing])
    }
}

struct EmojiRow_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRow(emoji: EmojiData().emoji[0])
            .previewLayout(.fixed(width: 350, height: 80))
    }
}
