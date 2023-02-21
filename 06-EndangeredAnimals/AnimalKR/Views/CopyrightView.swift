//
//  CopyrightView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct CopyrightView: View {
    var body: some View {
        ScrollView {
            Text("본 자료의 모든 저작권은 한국문화정보원에 있습니다.")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle("저작권")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CopyrightView()
        }
    }
}
