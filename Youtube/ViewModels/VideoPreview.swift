//
//  VideoPreview.swift
//  Youtube
//
//  Created by Anton Nagornyi on 23.06.2022.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject {
    
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    
    init(video: Video) {
        
        self.video = video
        self.title = video.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.date = df.string(from: video.published)
        
        guard video.thumbnail != "" else {return}
        
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            thumbnailData = cachedData
            return
        }
        
        guard let url = URL(string: video.thumbnail) else {return}
        
        AF.request(url).validate().responseData { responce in
            if let data = responce.data {
                CacheManager.setVideoCache(video.thumbnail, data)
                DispatchQueue.main.async {
                    self.thumbnailData = data
                }
            }
        }
        
    }
    
}
