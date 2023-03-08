//
//  BookSearchApp.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

@main
struct BookSearchApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
