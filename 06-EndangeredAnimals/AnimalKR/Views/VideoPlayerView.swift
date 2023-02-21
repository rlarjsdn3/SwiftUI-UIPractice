//
//  VideoPlayerView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct VideoPlayerView: View {
    let video: VideoModel
    
    var body: some View {
        NavigationView {
            YoutubeView(videoid: video.videoid)
                .navigationTitle("\(video.name) 비디오")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: .sample)
    }
}
