//
//  E_CommerceApp.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

@main
struct E_CommerceApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
