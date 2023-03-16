//
//  DatePickerFooterView.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import SwiftUI

struct DatePickerFooterView: View {
    @Binding var pickerModel: DatePickerModel
    
    var body: some View {
        HStack {
            Button {
                pickerModel.addingYearInterval(-1)
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title3)
            }

            Spacer()
            
            Text(pickerModel.year)
                .font(.system(.title3, design: .rounded, weight: .semibold))
            
            Spacer()
            
            Button {
                pickerModel.addingYearInterval(+1)
            } label: {
                Image(systemName: "arrow.right")
                    .font(.title3)
            }

        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.black)
        .padding(.top, -5)
        .padding(.bottom, 7)
        .padding(.horizontal, 10)
    }
}

struct DatePickerFooterView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerFooterView(pickerModel: .constant(DatePickerModel(date: Date())))
            .previewLayout(.sizeThatFits)
    }
}
