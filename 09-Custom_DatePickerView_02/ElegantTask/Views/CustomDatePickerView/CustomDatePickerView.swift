//
//  CustomDatePicker.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/01.
//

import SwiftUI

struct CustomDatePickerView: View {
    @State var date: Date = .now // 현재 달력 정보를 저장한 @State 래퍼 변수
    @State private var monthOffset: Int = 0 // 현재 날짜와 얼마나 떨어진(월 단위) 달력을 보여줘야 하는지 알려주는 변수
    @Binding var selection: Date // 클릭한 날짜를 저장한 @Binding 래퍼 변수 (상위 뷰에 전달)
    
    var body: some View {
        VStack(spacing: 35) {
            CustomDatePickerHeaderView(date: $date, monthOffset: $monthOffset)
            CustomDatePickerFooterView(date: $date, monthOffset: $monthOffset, selection: $selection)
        }
    }
}

// MARK: - PREVIEW

struct CustomDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePickerView(selection: .constant(Date()))
    }
}
