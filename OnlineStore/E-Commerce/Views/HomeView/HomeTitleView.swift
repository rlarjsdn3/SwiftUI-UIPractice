//
//  HomeTitleView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct HomeTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Let's")
                    .font(.title)
                    .foregroundColor(.primary)
                
                Text("Get Started!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct HomeTitleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTitleView()
            .previewLayout(.sizeThatFits)
    }
}
