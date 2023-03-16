//
//  CustomDatePickerFooterView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct CustomDatePickerFooterView: View {
    let columns = [GridItem](repeating: GridItem(.flexible()), count: 7)
    let weekDaySymbols = Calendar.current.shortWeekdaySymbols // 요일 심볼을 저장한 배열 변수
    
    @Binding var date: Date
    @Binding var monthOffset: Int
    @Binding var selection: Date
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(weekDaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(getCalendar()) { dateModel in
                    CardView(dateModel: dateModel, selection: $selection)
                        .padding(.horizontal, 4)
                        .background(
                            Capsule()
                                .fill(.orange)
                                .opacity(dateModel.date.isSameDate(with: selection) ? 1 : 0)
                                .padding(3)
                        )
                        .onTapGesture {
                            selection = dateModel.date
                        }
                }
            }
        }
    }
}

// MARK: - EXTENSION

extension CustomDatePickerFooterView {
    private func getDayOfMonth(_ date: Date, byAdding offset: Int) -> [Date] {
        let date = Calendar.current.date(from:
                                            DateComponents(
                                                year: Calendar.current.component(.year, from: date),
                                                month: Calendar.current.component(.month, from: date),
                                                day: 1
                                            )
        )!
        let dayOfMonth = Calendar.current.range(of: .day, in: .month, for: date)!
        return dayOfMonth.map { day -> Date in
            return Calendar.current.date(byAdding: .day, value: day - 1, to: date)!
        }
    }
    
    private func getCalendar() -> [DateModel] {
        var dateValueModel = getDayOfMonth(date, byAdding: monthOffset).map { date -> DateModel in
            DateModel(
                day: Calendar.current.component(.day, from: date),
                date: date
            )
        }
        
        let weekday = Calendar.current.component(
            .weekday,
            from: dateValueModel.first!.date
        )
        (1..<weekday).forEach { _ in
            dateValueModel.insert(DateModel(day: -1, date: Date().addingTimeInterval(-86400 * 365 * 365)), at: 0)
        }

        return dateValueModel
    }
}

struct CustomDatePickerFooterView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePickerFooterView(date: .constant(.now), monthOffset: .constant(0), selection: .constant(.now))
            .previewLayout(.sizeThatFits)
    }
}
