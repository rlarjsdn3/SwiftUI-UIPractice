//
//  DetailView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct DetailView: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.vertical, 10)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 25)
                    )
                
                Text(animal.headline)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding()
                
                VStack {
                    DetailHeadline(image: "photo.on.rectangle.angled", name: "\(animal.name) 사진")
                    DetailGallery(animal: animal)
                }
                .padding(.bottom, 20)
                 
                VStack {
                    DetailHeadline(image: "info.circle", name: "자세한 정보")
                    Text(animal.description)
                        .font(.subheadline)
                }
                .padding()
                
                VStack {
                    DetailHeadline(image: "location.magnifyingglass", name: "팩트 체크")
                    DetailFactCheck(animal: animal)
                }
                .padding()
                
                VStack {
                    DetailHeadline(image: "books.vertical", name: "참고 자료")
                    DetailReference(animal: animal)
                }
                .padding()
            }
            .navigationTitle("\(animal.name) 톺아보기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(animal: .sample)
        }
    }
}
