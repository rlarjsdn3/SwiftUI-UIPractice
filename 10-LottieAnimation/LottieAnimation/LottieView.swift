//
//  LottieView.swift
//  LottieAnimation
//
//  Created by 김건우 on 2023/03/05.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let loopMode: LottieLoopMode
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: "plane")
        animationView.play()
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView(loopMode: .loop)
    }
}
