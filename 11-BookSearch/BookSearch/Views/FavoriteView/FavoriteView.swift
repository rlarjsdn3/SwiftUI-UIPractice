//
//  FavoriteView.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.favoriteData.isEmpty {
                Text("즐겨찾기 항목이 없습니다!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.favoriteData, id: \.self) { item in
                        BookCellView(item: item)
                    }
                    .onDelete { indexSet in
                        viewModel.favoriteData.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("⭐️ 즐겨찾기")
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(ViewModel())
    }
}
