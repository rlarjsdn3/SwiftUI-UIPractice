//
//  ContentView.swift
//  AnimatedTabView
//
//  Created by 김건우 on 2023/02/22.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .ignoresSafeArea()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
