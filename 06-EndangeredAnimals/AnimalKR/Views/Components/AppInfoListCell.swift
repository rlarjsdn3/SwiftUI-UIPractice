//
//  AppInfoCell.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct AppInfoListCell: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if let content = content {
                    Text(content)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                if let linkLabel = linkLabel, let linkDestination = linkDestination {
                    Link(destination: URL(string: linkDestination)!) {
                        Label(linkLabel, systemImage: "arrow.up.right.square")
                            .labelStyle(.trailingIcon)
                    }
                }
            }
        }
    }
}

struct AppInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppInfoListCell(name: "Developer", content: "김문어")
            AppInfoListCell(name: "Developer", linkLabel: "김문어의 GitHub", linkDestination: "https://github.com/rlarjsdn3")
        }
        .previewLayout(.sizeThatFits)
    }
}
