//
//  HomeView.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "star.fill")
                }
            
            BookSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ViewModel())
    }
}
