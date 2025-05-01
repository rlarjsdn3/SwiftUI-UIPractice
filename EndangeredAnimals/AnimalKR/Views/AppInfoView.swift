//
//  AppInfoView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    AppInfoListCell(name: "Developer", content: "김문어")
                    AppInfoListCell(name: "Compatibility", content: "iOS 14.0")
                    AppInfoListCell(name: "Version", content: "1.0.0")
                    AppInfoListCell(name: "GitHub", linkLabel: "김문어의 GitHub", linkDestination: "https://github.com/rlarjsdn3")
                } header: {
                    Text("Application")
                }
                
                Section {
                    NavigationLink {
                        CopyrightView()
                    } label: {
                        Text("저작권")
                    }
                } header: {
                    Text("Copyright")
                }
            }
            .navigationTitle("앱 정보")
        }
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView()
    }
}
