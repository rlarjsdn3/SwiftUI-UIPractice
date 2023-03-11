//
//  SearchView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("검색 화면")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.blue)
            }
            .navigationTitle("검색")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.blue, for: .navigationBar)
                
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
