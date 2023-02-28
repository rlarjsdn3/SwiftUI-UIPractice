//
//  TaskRowCell.swift
//  TodoList
//
//  Created by 김건우 on 2023/02/27.
//

import SwiftUI

struct TaskRowCell: View {
    var task: String
    var isCompleted: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isCompleted ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

struct TaskRowCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowCell(task: "문어 이뻐해주기", isCompleted: true)
    }
}
