//
//  CoverImageView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct HomeCoverImage: View {
    @ObservedObject var viewModel: AnimalViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.covers) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(height: CGFloat.screenHeight * 0.3)
        .tabViewStyle(.page)
    }
}

struct HomeCoverImage_Previews: PreviewProvider {
    static var previews: some View {
        HomeCoverImage(viewModel: AnimalViewModel())
            .previewLayout(.sizeThatFits)
    }
}
