//
//  TodoListApp.swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var realmManager = RealmManager()
    
    var body: some Scene {
        WindowGroup {
            TasksView()
                .environmentObject(realmManager)
        }
    }
}
