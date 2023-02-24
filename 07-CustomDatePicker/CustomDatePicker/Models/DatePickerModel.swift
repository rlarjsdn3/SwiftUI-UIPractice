//
//  DatePickerModel.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import Foundation

struct DatePickerModel {
    // Date 데이터
    var date: Date
    // 일(Day) 데이터
    var day: String {
        String(Calendar.current.component(.day, from: date))
    }
    // 월(Month) 데이터
    var month: String {
        String(Calendar.current.component(.month, from: date))
    }
    // 연도(Year) 데이터
    var year: String {
        String(Calendar.current.component(.year, from: date))
    }
    // 월(Month) 심볼 데이터
    var monthIndex: Int {
        Int(month)! - 1
    }
    var monthSymbol: String {
        switch monthIndex {
        case 0:
            return "1월"
        case 1:
            return "2월"
        case 2:
            return "3월"
        case 3:
            return "4월"
        case 4:
            return "5월"
        case 5:
            return "6월"
        case 6:
            return "7월"
        case 7:
            return "8월"
        case 8:
            return "9월"
        case 9:
            return "10월"
        case 10:
            return "11월"
        default:
            return "12월"
        }
    }
    // 요일(DayOfTheWeek) 심볼 데이터
    var weekDayIndex: Int {
        Calendar.current.component(.weekday, from: date) - 1
    }
    var weekDaySymbol: String {
        switch weekDayIndex {
        case 0:
            return "일요일"
        case 1:
            return "월요일"
        case 2:
            return "화요일"
        case 3:
            return "수요일"
        case 4:
            return "목요일"
        case 5:
            return "금요일"
        default:
            return "토요일"
        }
    }
}

extension DatePickerModel {
    mutating func addingDayInterval(_ value: Int) {
        self.date = Calendar.current.date(byAdding: .day, value: value, to: date)!
    }
    
    mutating func addingMonthInterval(_ value: Int) {
        self.date = Calendar.current.date(byAdding: .month, value: value, to: date)!
    }
    
    mutating func addingYearInterval(_ value: Int) {
        self.date = Calendar.current.date(byAdding: .year, value: value, to: date)!
    }
}
