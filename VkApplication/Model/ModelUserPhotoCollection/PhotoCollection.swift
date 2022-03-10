//
//  PhotoCollection.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct PhotoCollection {
    let photo: String
}

extension PhotoCollection: Codable {
    enum CodingKeys: String, CodingKey {
        case photo = "url"
    }
}
