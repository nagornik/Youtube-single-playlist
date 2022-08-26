//
//  VideoDetail.swift
//  Youtube
//
//  Created by Anton Nagornyi on 23.06.2022.
//

import SwiftUI

struct VideoDetail: View {
    
    var video: Video
    var date: String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: video.published)
    }
    
    var body: some View {
        
        
        VStack (alignment: .leading, spacing: 10) {
            
            Text(video.title)
                .bold()
            
            Text(date)
                .foregroundColor(.gray)
            
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1280, height: 720), contentMode: .fit)
            
            ScrollView {
                Text(video.description)
            }
            
        }
        .font(.system(size: 19))
        .padding()
        .background(backgroundColor)
        
        
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
