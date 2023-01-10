//
//  profileImageView.swift
//  2-setting app
//
//  Created by 김건우 on 2023/01/10.
//

import SwiftUI

struct profileImageView: View {
    var body: some View {
        Image("김지지")
            .resizable()
            .scaledToFit()
            .offset(x: 0, y: 10)
            .clipShape(Circle())
    }
}

struct profileImageView_Previews: PreviewProvider {
    static var previews: some View {
        profileImageView()
    }
}
