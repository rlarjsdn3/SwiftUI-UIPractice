//
//  TaskModel.swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import Foundation
import RealmSwift

class TaskModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var isCompleted = false
}
