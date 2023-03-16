//
//  DetailButtonView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct DetailButtonView: View {
    @Binding var showDetailView: Bool
    @Binding var transitionAnimation: Bool
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                transitionAnimation = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        showDetailView = false
                    }
                }
            }
        } label: {
            Text("장바구니에 담기")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    Color.black
                }
                .cornerRadius(15)
                .padding()
        }
    }
}

struct DetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DetailButtonView(showDetailView: .constant(false), transitionAnimation: .constant(false))
    }
}
