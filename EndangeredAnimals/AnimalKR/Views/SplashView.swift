//
//  SplashView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            tigerImage
        }
    }
}

extension SplashView {
    var tigerImage: some View {
        VStack(spacing: 20) {
            Image("splash")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("한국의 멸종 위기 동물들")
                .font(.largeTitle)
                .foregroundColor(.accentColor.opacity(0.8))
                .bold()
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                size = 1.0
                opacity = 1.0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
