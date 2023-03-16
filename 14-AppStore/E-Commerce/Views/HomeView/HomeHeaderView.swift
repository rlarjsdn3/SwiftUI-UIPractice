//
//  HomeHeaderView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }

            Spacer()
            
            Button {
                
            } label: {
                Image("김지지")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(15)
            }
        }
        .padding()
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
