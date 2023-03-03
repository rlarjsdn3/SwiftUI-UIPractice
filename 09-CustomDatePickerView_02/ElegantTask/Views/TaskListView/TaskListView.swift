//
//  TaskListView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Binding var date: Date
    
    var body: some View {
        VStack(spacing: 10) {
            let taskModel = taskViewModel.tasks.first {
                $0.taskDate.isSameDate(with: date)
            }
            
            if let taskModel = taskModel  {
                ListView(taskModel: taskModel)
            } else {
                nothingTodo
            }
        }
    }
}

extension TaskListView {
    var nothingTodo: some View {
        Text("할 일이 없어요!")
            .fontWeight(.semibold)
            .padding(.horizontal)
            .padding(.vertical, 3)
            .foregroundColor(.white)
            .background(.orange)
            .cornerRadius(15)
            .padding(.top, 10)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(date: .constant(.now))
            .environmentObject(TaskViewModel())
            .previewLayout(.sizeThatFits)
    }
}
