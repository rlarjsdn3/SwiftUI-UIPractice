//
//  VisualEffectView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI
import UIKit

struct VisualEffectView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let effect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: effect)
        return visualEffectView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

#Preview {
    VisualEffectView(style: .systemMaterialLight)
}
