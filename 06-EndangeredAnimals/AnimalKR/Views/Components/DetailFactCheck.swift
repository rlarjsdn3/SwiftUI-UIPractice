//
//  DetailFact.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct DetailFactCheck: View {
    let animal: AnimalModel
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            .tabViewStyle(.page)
        }
    }
}

struct DetailFact_Previews: PreviewProvider {
    static var previews: some View {
        DetailFactCheck(animal: .sample)
    }
}
