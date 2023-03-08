//
//  ContentView.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct BookSearchView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                if viewModel.searchData.items.isEmpty {
                    Text("검색 결과가 없습니다.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .listRowSeparator(.hidden)
                        .padding(.top, 20)
                } else {
                    ForEach(viewModel.searchData.items, id: \.self) { item in
                        NavigationLink {
                            DetailView(item: item)
                        } label: {
                            BookCellView(item: item)
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("검색"))
            .navigationTitle("📚 도서 검색")
            .listStyle(.plain)
        }
        .onChange(of: searchText) { _ in
            viewModel.requestBookAPISearch(query: searchText)
        }
    }
}

struct BookSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchView()
            .environmentObject(ViewModel())
    }
}
