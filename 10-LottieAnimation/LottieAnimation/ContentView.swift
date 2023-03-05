//
//  ContentView.swift
//  LottieAnimation
//
//  Created by 김건우 on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LottieView(loopMode: .loop)
            .scaleEffect(0.4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
