//
//  TasksView.swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var showAddTaskView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                    TaskRowCell(task: task.title, isCompleted: task.isCompleted)
                        .onTapGesture {
                            withAnimation(.easeOut(duration: 0.1)) {
                                realmManager.updateTask(id: task.id, isCompeleted: !task.isCompleted)
                            }
                        }
                }
                .onDelete { indexSet in
                      indexSet.forEach { index in
                          let taskTodelete = realmManager.tasks[index]
                          realmManager.deleteTask(id: taskTodelete.id)
                      }
                  }
            }   
            .navigationTitle("My Tasks")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.red, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }

                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView()
                    .presentationDetents([.medium, .large])
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
