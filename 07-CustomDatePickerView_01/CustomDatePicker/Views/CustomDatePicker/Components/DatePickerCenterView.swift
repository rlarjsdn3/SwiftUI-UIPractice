//
//  DatePickerCenterView.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import SwiftUI

struct DatePickerCenterView: View {
    @Binding var pickerModel: DatePickerModel
    
    var body: some View {
        HStack {
            Button {
                pickerModel.addingDayInterval(-1)
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack {
                Text(pickerModel.day)
                    .font(.system(size: 65, weight: .bold, design: .rounded))
                
                Text(pickerModel.weekDaySymbol)
                    .font(.system(.title3, design: .rounded))
            }
            
            Spacer()
            
            Button {
                pickerModel.addingDayInterval(+1)
            } label: {
                Image(systemName: "arrow.right")
                    .font(.title3)
                    .foregroundColor(.black)
            }

        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 10)
    }
}

struct DatePickerCenterView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCenterView(pickerModel: .constant(DatePickerModel(date: Date())))
            .previewLayout(.sizeThatFits)
    }
}
