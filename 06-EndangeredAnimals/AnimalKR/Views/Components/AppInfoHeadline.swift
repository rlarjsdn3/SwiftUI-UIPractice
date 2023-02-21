//
//  AppInfoLabel.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct AppInfoHeadline: View {
    var text: String
    var systemImage: String
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: systemImage)
        }
    }
}

struct AppInfoLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoHeadline(text: "AppInfoHead", systemImage: "gear")
    }
}
