//
//  RealmManager.swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [TaskModel] = []
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let configuration = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = configuration
            localRealm = try Realm()
            getTasks()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(TaskModel.self).sorted(byKeyPath: "isCompleted")
            tasks.removeAll()
            allTasks.forEach {
                tasks.append($0)
            }
        }
    }
    
    func addTask(title taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let task = TaskModel(value: ["title": taskTitle, "isCompleted": false])
                    localRealm.add(task)
                }
                getTasks()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func updateTask(id: ObjectId, isCompeleted: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else { return }
                try localRealm.write {
                    taskToUpdate[0].isCompleted = isCompeleted
                }
                getTasks()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(TaskModel.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else  { return }
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                }
            } catch {
                print("Delete Error")
                print(error.localizedDescription)
            }
        }
    }
}
