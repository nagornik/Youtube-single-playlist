//
//  VideoModel.swift
//  Youtube
//
//  Created by Anton Nagornyi on 22.06.2022.
//

import Foundation
import Alamofire

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        
        guard let url = URL(string: "\(Constants.apiUrl)/playlistItems") else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(url, parameters: ["part": "snippet", "playlistId": Constants.playlistId, "key": Constants.apiKey])
            .validate()
            .responseDecodable(of: Responce.self, decoder: decoder) { responce in
                switch responce.result {
                case .success:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
                
                if let itams = responce.value?.items {
                    DispatchQueue.main.async {
                        self.videos = itams
                    }
                }
                
            }
        
    }
    
}
