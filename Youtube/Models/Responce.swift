//
//  Responce.swift
//  Youtube
//
//  Created by Anton Nagornyi on 22.06.2022.
//

import Foundation

struct Responce: Decodable {
    
    var items: [Video]
    
    enum codingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}
