//
//  VideoRow.swift
//  Youtube
//
//  Created by Anton Nagornyi on 23.06.2022.
//

import SwiftUI

struct VideoRow: View {
    
    @ObservedObject var videoPreview: VideoPreview
    @State private var isPresenting = false
    @State private var imageHeight: CGFloat = 0
    
    var body: some View {
        
        Button {
            isPresenting = true
        } label: {
            VStack (alignment: .leading, spacing: 10) {
                GeometryReader { geo in
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width*9/16)
                        .clipped()
                        .onAppear {
                            imageHeight = geo.size.width*9/16
                        }
                }
                .frame(height: imageHeight)
                Text(videoPreview.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
        }
        .sheet(isPresented: $isPresenting) {
            VideoDetail(video: videoPreview.video)
        }

        
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
