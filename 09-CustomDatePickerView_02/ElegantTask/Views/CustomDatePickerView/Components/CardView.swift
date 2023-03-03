//
//  CardView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct CardView: View {
    var dateModel: DateModel
    
    @Binding var selection: Date
    
    var body: some View {
        VStack {
            // 해당 칸에 일(Day)을 표시할 수 있는 경우
            if dateModel.day != -1 {
                let taskModel = TaskModel.sample.first {
                    dateModel.date.isSameDate(with: $0.taskDate)
                }
                
                // 해당 일(Day)에 작업이 있는 경우
                if let taskModel = taskModel {
                    dayText(dateModel: dateModel, selection: selection)
                    
                    Spacer(minLength: 0)
                    
                    taskCircle(taskModel: taskModel)
            
                // 해당 일(Day)에 작업이 없는 경우
                } else {
                    dayText(dateModel: dateModel, selection: selection)
                }
            // 해당 칸에 일(Day)을 표시하면 안되는 경우
            }
        }
        .padding(.vertical, 8)
        .frame(height: 50, alignment: .top)
    }
}

extension CardView {
    @ViewBuilder
    func dayText(dateModel: DateModel, selection: Date) -> some View {
        Text("\(dateModel.day)")
            .font(.title3)
            .fontWeight(.bold)
            .frame(width: 30)
            .foregroundColor(dateModel.date.isSameDate(with: selection) ? .white : .black)
    }
    
    @ViewBuilder
    func taskCircle(taskModel: TaskModel) -> some View {
        Circle()
            .frame(width: 8, height: 8)
            .foregroundColor(taskModel.taskDate.isSameDate(with: selection) ? .white : .orange)
    }
}

struct CardView_Previews: PreviewProvider {
    static let day = Calendar.current.component(.day, from: .now)
    
    static var previews: some View {
        CardView(dateModel: DateModel(day: day, date: .now), selection: .constant(.now))
    }
}
