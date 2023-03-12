//
//  HomeView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: TabItem = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                HomeView()
                    .tag(TabItem.home)
                
                SearchView()
                    .tag(TabItem.search)
                
                FavoritesView()
                    .tag(TabItem.favorites)
                
                SettingsView()
                    .tag(TabItem.settings)
            }
            
            CustomTabView(selected: $selected)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
