//
//  VideoListCell.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct VideoListCell: View {
    let video: VideoModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
                
                Image(systemName: "play.circle")
                    .imageScale(.large)
                    .shadow(radius: 5)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(video.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListCell_Previews: PreviewProvider {
    static var previews: some View {
        VideoListCell(video: .sample)
    }
}
