//
//  VideoView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/20.
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel: AnimalViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.videos) { video in
                    NavigationLink {
                        VideoPlayerView(video: video)
                    } label: {
                        VideoListCell(video: video)
                    }

                }
            }
            .listStyle(.plain)
            .navigationTitle("비디오")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(viewModel: AnimalViewModel())
    }
}
