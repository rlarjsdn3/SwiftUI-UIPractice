//
//  ListCell.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct HomeListCell: View {
    let animal: AnimalModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                Text(animal.name)
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell(animal: .sample)
            .previewLayout(.sizeThatFits)
    }
}
