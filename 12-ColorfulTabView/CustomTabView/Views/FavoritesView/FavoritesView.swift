//
//  FavoritesView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("좋아요 화면")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.cyan)
            }
            .navigationTitle("좋아요")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.cyan, for: .navigationBar)
                
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
