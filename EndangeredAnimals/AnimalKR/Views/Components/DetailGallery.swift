//
//  DetailGallery.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct DetailGallery: View {
    let animal: AnimalModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { gallery in
                    Image(gallery)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 150)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct DetailGallery_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallery(animal: .sample)
    }
}
