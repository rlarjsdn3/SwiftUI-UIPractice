//
//  ContentView.swift
//  1-sunrise
//
//  Created by 김건우 on 2023/01/04.
//

import SwiftUI

struct ContentView: View {
    fileprivate var sunSFSymbolName: [String] = ["sunrise", "sun.max", "sunset"]
    fileprivate var sunButtonName: [String] = ["뜹니다!", "떠 있어요!", "집니다!"]
    @State private var sunrise: Int = 0
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(systemName: sunSFSymbolName[sunrise])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Spacer()
                
                HStack {
                    Text("해가")
                    
                    Button {
                        sunrise = (sunrise + 1) % 3
                    } label: {
                        Text(sunButtonName[sunrise])
                            .padding()
                            .background(.orange)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
