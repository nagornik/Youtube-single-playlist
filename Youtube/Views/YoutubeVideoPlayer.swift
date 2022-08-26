//
//  YoutubeVideoPlayer.swift
//  Youtube
//
//  Created by Anton Nagornyi on 23.06.2022.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        let view = WKWebView()
        
        view.backgroundColor = UIColor(backgroundColor)
        
        let embedUrlString = Constants.youtubeEmbedUrl + video.videoId
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
