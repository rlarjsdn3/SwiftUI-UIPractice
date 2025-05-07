//
//  BookMyTripApp.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import SwiftUI

@main
struct BookMyTripApp: App {
    var body: some Scene {
        WindowGroup {
            FindDealsView()
                .dynamicTypeSize(.xSmall ... .xLarge)
        }
    }
}
