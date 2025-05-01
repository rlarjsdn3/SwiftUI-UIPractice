//
//  ThemePicker.swift
//  Scrumdiger
//
//  Created by 김건우 on 2023/01/31.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeCell(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.automatic)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
