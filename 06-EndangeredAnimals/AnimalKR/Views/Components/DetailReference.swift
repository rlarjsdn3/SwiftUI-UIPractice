//
//  DetailReferecne.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct DetailReference: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            HStack {
                Label("멸종위기 야생동물 포털", systemImage: "globe")
                    .labelStyle(.trailingIcon)
                
                Spacer()
                
                Link(destination: URL(string: animal.link)!) {
                    Image(systemName: "arrow.up.right.square")
                }
            }
        }
    }
}

struct DetailReferecne_Previews: PreviewProvider {
    static var previews: some View {
        DetailReference(animal: .sample)
    }
}
