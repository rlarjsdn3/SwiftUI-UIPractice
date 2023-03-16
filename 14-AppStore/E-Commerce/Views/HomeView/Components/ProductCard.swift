//
//  ProductCard.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var product: Product
    @Binding var showDetailView: Bool
    var cardNamespace: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text(product.price)
                    .fontWeight(.semibold)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white.opacity(0.5))
                    }
            }
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "image", in: cardNamespace)
                .padding(.vertical, 10)
            
            Text(product.title)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .matchedGeometryEffect(id: "title", in: cardNamespace)
                .padding(.horizontal, 5)
                .padding(.bottom, -5)
            
            Text(product.subTitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .minimumScaleFactor(0.1)
                .matchedGeometryEffect(id: "subTitle", in: cardNamespace)

            
            HStack {
                Text(product.rating)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.1)
                    .matchedGeometryEffect(id: "rating", in: cardNamespace)
                
                Spacer()
                
                Image(systemName: "suit.heart")
                    .fontWeight(.semibold)
                    .matchedGeometryEffect(id: "heart", in: cardNamespace)
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
        }
        .background {
            product.color
                .matchedGeometryEffect(id: "color", in: cardNamespace)
        }
        .cornerRadius(15)
    }
}

struct ProductCard_Previews: PreviewProvider {
    @Namespace static var cardNamespace: Namespace.ID
    
    static var previews: some View {
        ProductCard(
            product: .sample[0],
            showDetailView: .constant(false),
            cardNamespace: cardNamespace
        )
        .environmentObject(ViewModel())
    }
}
