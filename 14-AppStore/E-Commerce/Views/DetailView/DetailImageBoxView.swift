//
//  DetailImageBoxView.swift
//  E-Commerce
//
//  Created by 김건우 on 2023/03/15.
//

import SwiftUI

struct DetailImageBoxView: View {
    var product: Product
    var cardNamespace: Namespace.ID
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "image", in: cardNamespace)
                .frame(height: UIScreen.main.bounds.height / 7)
            
            Text(product.title)
                .font(.title)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.1)
                .matchedGeometryEffect(id: "title", in: cardNamespace)
            
            Text(product.subTitle)
                .font(.headline)
                .foregroundColor(.secondary)
                .minimumScaleFactor(0.1)
                .matchedGeometryEffect(id: "subTitle", in: cardNamespace)
            
            Spacer()
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                .matchedGeometryEffect(id: "heart", in: cardNamespace)
                
                Spacer()
                
                Text(product.rating)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .minimumScaleFactor(0.1)
                    .matchedGeometryEffect(id: "rating", in: cardNamespace)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            product.color
                .matchedGeometryEffect(id: "color", in: cardNamespace)
                .cornerRadius(30)
                .clipShape(ProductDetailShape())
        }
        .frame(height: UIScreen.main.bounds.height / 3)
        .padding()
    }
}

struct DetailImageBoxView_Previews: PreviewProvider {
    @Namespace static var cardNamespace: Namespace.ID
    
    static var previews: some View {
        DetailImageBoxView(product: Product.sample[0], cardNamespace: cardNamespace)
//            .previewLayout(.sizeThatFits)
    }
}
