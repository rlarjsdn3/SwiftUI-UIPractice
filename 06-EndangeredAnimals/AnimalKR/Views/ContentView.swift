//
//  HomeView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = AnimalViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            VideoView(viewModel: viewModel)
                .tabItem {
                    Label("Video", systemImage: "play.rectangle")
                }
            GalleryView(viewModel: viewModel)
                .tabItem {
                    Label("Gallary", systemImage: "photo")
                }
            AppInfoView()
                .tabItem {
                    Label("AppInfo", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
