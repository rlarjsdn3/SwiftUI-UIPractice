//
//  ElegantTaskApp.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import SwiftUI

@main
struct ElegantTaskApp: App {
    @StateObject var taskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(taskViewModel)
        }
    }
}


// 내일 할 일

// 1 - DetailView 추가해서 세부 뷰로 이동 가능하게 만들기 (Detail View는 간단하게만 구현)
// 2 - TaskAddView 완성하기 (ViewModel 구현 등)
