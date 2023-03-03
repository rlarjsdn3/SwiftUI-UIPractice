//
//  TaskViewModel.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = TaskModel.sample
}
