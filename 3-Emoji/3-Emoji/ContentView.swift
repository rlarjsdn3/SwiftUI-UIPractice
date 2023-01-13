//
//  ContentView.swift
//  3-Emoji
//
//  Created by 김건우 on 2023/01/13.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var emojiData: EmojiData
    @State private var showAddSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(emojiData.emoji) { emoji in
                    NavigationLink {
                        EmojiDetailView(emoji: emoji)
                    } label: {
                        EmojiRow(emoji: emoji)
                    }
                }
                .onDelete { IndexSet in
                    emojiData.emoji.remove(atOffsets: IndexSet)
                }
            }
            .navigationTitle("Emoji")
            .toolbar {
                ToolbarItem {
                    Button {
                        showAddSheet = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                EmojiAddView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EmojiData())
    }
}
