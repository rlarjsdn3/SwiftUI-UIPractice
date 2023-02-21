//
//  YoutubeView.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
    let videoid: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/" + videoid) else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
