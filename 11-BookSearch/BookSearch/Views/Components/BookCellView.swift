//
//  BookCellView.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct BookCellView: View {
    var item: BookModel.Item
    
    var reducedAuthor: String {
        let authors = item.author.split(separator: "^").map { String($0) }
        if authors.count <= 1 {
            return item.author
        } else {
            return authors[0] + "외 " + "\(authors.count - 1)명"
        }
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.leading, -20)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 7) {
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.black)
                    .lineLimit(2)
                
                Text("\(reducedAuthor)")
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                Text("\(item.publisher)")
                    .font(.footnote)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct BookCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookCellView(item: BookModel.preview.items[0])
            .previewLayout(.sizeThatFits)
    }
}
