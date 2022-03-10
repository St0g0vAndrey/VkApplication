//
//  UserItems.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct UserItems {
    let items: [UserPhoto]
}

extension UserItems: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
