//
//  UserSizes.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct UserSizes {
    let albumId: Int
    let sizes: [PhotoCollection]
}

extension UserSizes: Codable {
    enum CodingKeys: String, CodingKey {
        case sizes = "sizes"
        case albumId = "album_id"
    }
}
