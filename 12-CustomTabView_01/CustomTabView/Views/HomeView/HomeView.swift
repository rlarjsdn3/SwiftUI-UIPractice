//
//  HomeView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("홈 화면")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.orange)
            }
            .navigationTitle("홈")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.orange, for: .navigationBar)
                
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
