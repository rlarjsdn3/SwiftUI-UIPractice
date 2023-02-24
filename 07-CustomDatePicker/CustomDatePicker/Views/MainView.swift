//
//  MainView.swift
//  CustomDatePicker
//
//  Created by 김건우 on 2023/02/24.
//

import SwiftUI

struct MainView: View {
    @State private var pickerModel = DatePickerModel(date: Date())
    @State private var isSheetShow = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    isSheetShow = true
                } label: {
                    Image(systemName: "calendar")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .clipShape(Circle())
                }
                .sheet(isPresented: $isSheetShow) {
                    CustomDatePickerView(pickerModel: $pickerModel)
                }
                .padding()
                
                Text("선택하신 날짜는 \(pickerModel.year)년 \(pickerModel.month)월 \(pickerModel.day)일입니다.")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(15)

            }
            .navigationTitle("날짜 선택하기")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
