//
//  EmojiDetailView.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import SwiftUI

struct EmojiDetailView: View {
    @State private var scale: Bool = false
    @State private var color: Color = .gray
    
    var emoji: Emoji
    
    var body: some View {
        VStack {
            Text(emoji.emoji)
                .font(.system(size: 100))
                .shadow(color: color, radius: 30)
                .scaleEffect(scale ? 1.5 : 1)
                .rotation3DEffect(Angle.degrees(scale ? 360 : 0), axis: (x: 5, y: 2, z: 1))
                .animation(.spring(response: 0.5, dampingFraction: 0.5), value: scale)
                
            Divider()
            
            Toggle(isOn: $scale) {
                Text("이모지 스케일 업")
                    .bold()
            }
            .padding()
            
            ColorPicker("그림자 색상 선택", selection: $color)
                .bold()
                .padding()
        }
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(emoji: EmojiData().emoji[0])
    }
}
