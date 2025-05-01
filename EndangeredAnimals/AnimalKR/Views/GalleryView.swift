//
//  GallaryView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var viewModel: AnimalViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    Image(viewModel.selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.accentColor, lineWidth: 4)
                        )
                    
                    Slider(value: $viewModel.gridColumn, in: 2...4, step: 1.0) { _ in
                        withAnimation(.easeInOut) {
                            viewModel.gridSwitch()
                        }
                    }
                        .padding()
                    
                    LazyVGrid(columns: viewModel.gridLayout, spacing: 20) {
                        ForEach(viewModel.animals) { animal in
                            Image(animal.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .onTapGesture {
                                    viewModel.selectedImage = animal.image
                                }
                        }
                    }
                }
            }
            .navigationTitle("갤러리")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(viewModel: AnimalViewModel())
    }
}
