//
//  ContentView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/12.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: TabItem = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.cyan
                .ignoresSafeArea()
            
            TabView(selection: $selected) {
                Color.orange.ignoresSafeArea()
                    .tag(TabItem.home)
                
                Color.blue.ignoresSafeArea()
                    .tag(TabItem.bookmark)
                
                Color.cyan.ignoresSafeArea()
                    .tag(TabItem.search)
                
                Color.gray.ignoresSafeArea()
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
