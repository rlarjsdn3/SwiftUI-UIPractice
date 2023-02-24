//
//  CustomDatePickerView.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import SwiftUI

struct CustomDatePickerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var pickerModel: DatePickerModel
    
    let frameWidth = UIScreen.main.bounds.width / 1.8
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 15) {
                    DatePickerHeaderView(pickerModel: $pickerModel)
                    DatePickerCenterView(pickerModel: $pickerModel)
                    Divider()
                    DatePickerFooterView(pickerModel: $pickerModel)
                }
                .frame(width: frameWidth)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("선택하기")
                        .frame(width: frameWidth)
                        .padding()
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }

            }
        }
    }
}

struct CustomDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePickerView(pickerModel: .constant(DatePickerModel(date: Date())))
    }
}
