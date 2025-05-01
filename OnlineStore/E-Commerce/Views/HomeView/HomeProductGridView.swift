//
//  ProductGridView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct HomeProductGridView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedProduct: Product
    @Binding var showDetailView: Bool
    
    var cardNamespace: Namespace.ID
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.products) { product in
               ProductCard(product: product,
                           showDetailView: $showDetailView,
                           cardNamespace: cardNamespace
               )
               .onTapGesture {
                   withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                       showDetailView = true
                   }
               }
            }
        }
        .padding()
    }
}

struct HomeProductGridView_Previews: PreviewProvider {
    @Namespace static var cardNamespace: Namespace.ID
    
    static var previews: some View {
        HomeProductGridView(
            selectedProduct: .constant(Product.sample[0]),
            showDetailView: .constant(false),
            cardNamespace: cardNamespace
        )
        .environmentObject(ViewModel())
    }
}
