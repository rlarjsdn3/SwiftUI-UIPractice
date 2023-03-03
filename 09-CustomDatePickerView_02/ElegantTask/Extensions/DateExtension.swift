//
//  DateExtension.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import Foundation

extension Date {
    func isSameDate(with date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}
