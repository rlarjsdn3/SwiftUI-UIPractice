//
//  DetailScrollView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct DetailScrollView: View {
    @Binding var transitionAnimation: Bool
    
    var body: some View {
        VStack {
            if transitionAnimation {
                ScrollView {
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Label("Apple Trade In", systemImage: "wonsign.circle.fill")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("보상 판매 대상 시계를 반납하고 최대 ₩180,000의 환급액을 받거나, 무료로 재활용하세요.")
                                .font(.subheadline)
                                .padding(.leading, 35)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                        .background {
                            Color("color2")
                        }
                        .cornerRadius(15)
                        .padding(.horizontal)
                    }
                }
                .opacity(transitionAnimation ? 1 : 0)
                
            }
            
        }
    }
}

struct DetailScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScrollView(transitionAnimation: .constant(false))
    }
}
