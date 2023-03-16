//
//  SettingsView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("설정 화면")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.purple)
            }
            .navigationTitle("설정")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.purple, for: .navigationBar)
                
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
