//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 김건우 on 2023/01/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
