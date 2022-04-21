//
//  UserPhotoResponse.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct UserPhotoResponse {
    let photoResponse: UserItems
}

extension UserPhotoResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case photoResponse = "response"
    }
}
