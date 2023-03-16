//
//  ListCell.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct ListCellView: View {
    var task: TaskModel.Task
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aaa"
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(task.title)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(formatter.string(from: task.time))")
            }
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        .background(
            Color.orange
                .opacity(0.7)
        )
        .cornerRadius(15)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(task: TaskModel.sample[0].tasks[0])
            .previewLayout(.sizeThatFits)
    }
}
