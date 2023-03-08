//
//  DetailView.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
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
        VStack(spacing: 20) {
            Spacer()
            
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(
                        Circle()
                    )
                    .overlay {
                        Circle()
                            .stroke(.black, lineWidth: 3)
                    }
            } placeholder: {
                ProgressView()
            }

            VStack(spacing: 10) {
                Text(item.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(reducedAuthor) 저자")
                    .font(.headline)
                    .fontWeight(.light)
            }
            
            Spacer()
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("나가기")
                }
                .buttonStyle(ColorButtonStyle(color: .gray))
                
                Button {
                    viewModel.favoriteData.append(item)
                    dismiss()
                } label: {
                    Text("즐거찾기에 추가")
                }
                .buttonStyle(ColorButtonStyle(color: .red))

            }
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: BookModel.preview .items[0])
            .environmentObject(ViewModel())
    }
}
