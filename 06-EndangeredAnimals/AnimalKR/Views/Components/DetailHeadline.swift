//
//  DetailTitle.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct DetailHeadline: View {
    var image: String
    var name: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(name)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding(.vertical, 10)
    }
}

struct DetailHeadLine_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeadline(image: "photo.on.rectangle.angled", name: "호랑이 사진")
            .previewLayout(.sizeThatFits)
    }
}
