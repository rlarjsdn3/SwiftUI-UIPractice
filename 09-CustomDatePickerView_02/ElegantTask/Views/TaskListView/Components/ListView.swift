//
//  ListView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct ListView: View {
    var taskModel: TaskModel
    
    var body: some View {
        ForEach(taskModel.tasks) { task in
            ListCellView(task: task)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(taskModel: TaskModel.sample[0])
    }
}
