//
//  EmojiAddView.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import SwiftUI

struct EmojiAddView: View {
    @EnvironmentObject var emojiData: EmojiData
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var emoji: String = ""
    @State private var alert: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("이름   ")
                        TextField("", text: $name)
                            .autocorrectionDisabled(true)
                    }
                    
                    HStack {
                        Text("이모지")
                        TextField("", text: $emoji)
                            .autocorrectionDisabled(true)
                        
                    }
                } footer: {
                    Text("이모지의 기본 정보를 입력해주세요.")
                }
            }
            .toolbar {
                Button {
                    if name.isEmpty && emoji.isEmpty {
                        alert = true
                    } else {
                        emojiData.emoji.append(Emoji(name: name, emoji: emoji, date: .now))
                        dismiss()
                    }
                } label: {
                    Label("Add", systemImage: "plus")
                }
                .alert("경고", isPresented: $alert) {
                    // (공란)
                } message: {
                    Text("빈 칸에 내용을 작성해주세요.")
                }
            }
        }
    }
}

struct EmojiAddView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiAddView()
            .environmentObject(EmojiData())
    }
}
