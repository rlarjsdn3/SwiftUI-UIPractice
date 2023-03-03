//
//  TaskModel.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import Foundation

struct TaskModel: Identifiable {
    var id = UUID().uuidString
    var tasks: [Task]
    var taskDate: Date
    
    struct Task: Identifiable {
        var id = UUID().uuidString
        var title: String
        var time: Date = Date()
    }
}

extension TaskModel {
    static var sample: [TaskModel] {
        [TaskModel(
            tasks: [Task(title: "문어 이뻐해주기"), Task(title: "흰둥이 씻겨주기"), Task(title: "지지 쓰다듬어주기")],
            taskDate: Calendar.current.date(byAdding: .day, value: +1, to: .now)!
         ),
         TaskModel(
             tasks: [Task(title: "엄마 안부 전화드리기"), Task(title: "고래와 놀아주기")],
             taskDate: Calendar.current.date(byAdding: .day, value: -3, to: .now)!
         ),
         TaskModel(
             tasks: [Task(title: "흰둥이집 청소하기"), Task(title: "흰둥이와 산책하기")],
             taskDate: Calendar.current.date(byAdding: .day, value: -8, to: .now)!
         )]
    }
}


