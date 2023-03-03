//
//  DateValue.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import Foundation

struct DateModel: Identifiable {
    var id = UUID().uuidString // 고유 UUID
    var day: Int // 실제 달력에 표시할 일(Day)을 저장한 변수
    
    var date: Date // 표시된 날짜(Date)와 내가 클릭한 날짜(Date)가 맞는지 비교를 위한 변수
}
