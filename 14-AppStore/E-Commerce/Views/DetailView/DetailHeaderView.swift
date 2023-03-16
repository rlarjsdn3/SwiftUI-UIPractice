//
//  DetailHeaderView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct DetailHeaderView: View {
    @Binding var showDetailView: Bool
    @Binding var transitionAnimation: Bool
    
    var body: some View {
        HStack {
            Button {
                // 빨간 박스부터 사라지게 한 다음 -> 디테일 뷰 사라지게 하기!
                withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                    transitionAnimation = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            showDetailView = false
                        }
                    }
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }

            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            .padding(.horizontal)

            Button {
                
            } label: {
                Image(systemName: "bag")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
        }
        .padding()
    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(showDetailView: .constant(false), transitionAnimation: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
