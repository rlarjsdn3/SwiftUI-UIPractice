//
//  ContentView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List {
                HomeCoverImage(viewModel: viewModel)
                    .listRowInsets(
                        EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
                    )
                
                ForEach(viewModel.animals) { animal in
                    NavigationLink {
                        DetailView(animal: animal)
                    } label: {
                        HomeListCell(animal: animal)
                            .padding(.horizontal, -15)
                    }

                }
            }
            .listStyle(.plain)
            .navigationTitle("멸종위기동물 사전")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: AnimalViewModel())
    }
}
