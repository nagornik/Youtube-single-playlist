//
//  Home.swift
//  Youtube
//
//  Created by Anton Nagornyi on 23.06.2022.
//

import SwiftUI

let backgroundColor = Color(red: 31/255, green: 33/255, blue: 36/255)

struct Home: View {
    
    @StateObject var model = VideoModel()
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                ForEach(model.videos, id:\.videoId) { video in
                    VideoRow(videoPreview: VideoPreview(video: video))
                        .padding()
                }
            }
            .padding(.top, 20)
        }
        .foregroundColor(.white)
        .background(backgroundColor)
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
