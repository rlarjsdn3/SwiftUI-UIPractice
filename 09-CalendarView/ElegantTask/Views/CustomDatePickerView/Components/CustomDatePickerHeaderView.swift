//
//  CustomDatePickerHeaderView.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct CustomDatePickerHeaderView: View {
    var yearSymbol: String { // 연도 심볼을 저장한 변수
        String(Calendar.current.component(.year, from: date))
    }
    var monthSymbol: String { // 월 심볼을 저장한 변수
        Calendar.current.monthSymbols[
            Calendar.current.component(.month, from: date) - 1
        ]
    }
    
    @Binding var date: Date
    @Binding var monthOffset: Int
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(yearSymbol)
                    .font(.caption)
                    .fontWeight(.semibold)
                
                Text(monthSymbol)
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            headerButton(systemImage: "chevron.left", offset: -1)
            headerButton(systemImage: "chevron.right", offset: +1)
        }
        .onChange(of: monthOffset) { _ in
            date = Calendar.current.date(byAdding: .month, value: monthOffset, to: .now)!
        }
        .padding(.horizontal)
        .padding(.bottom, -10)
    }
}

extension CustomDatePickerHeaderView {
    @ViewBuilder
    func headerButton(systemImage image: String, offset: Int) -> some View {
        Button {
            monthOffset += offset
        } label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(.black)
        }
    }
}

struct CustomDatePickerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePickerHeaderView(date: .constant(.now), monthOffset: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
