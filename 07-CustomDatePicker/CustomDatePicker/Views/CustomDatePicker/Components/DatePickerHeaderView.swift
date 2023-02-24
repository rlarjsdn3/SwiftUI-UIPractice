//
//  DatePickerHeaderView.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import SwiftUI

struct DatePickerHeaderView: View {
    @Binding var pickerModel: DatePickerModel
    
    var body: some View {
        HStack {
            Button {
                pickerModel.addingMonthInterval(-1)
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title3)
            }
            
            Spacer()
            
            Text(pickerModel.monthSymbol)
                .font(.system(.title, design: .rounded, weight: .bold))
            
            Spacer()
            
            Button {
                pickerModel.addingMonthInterval(+1)
            } label: {
                Image(systemName: "arrow.right")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .foregroundColor(.white)
        .background(.red)
    }
}

struct DatePickerHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerHeaderView(pickerModel: .constant(DatePickerModel(date: Date())))
            .previewLayout(.sizeThatFits)
    }
}
