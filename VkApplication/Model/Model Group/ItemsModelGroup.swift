//
//  ItemsModelGroup.swift
//  VkApplication
//
//  Created by Андрей Стогов on 09.03.2022.
//

import Foundation

struct ItemsModelGroup {
    let items: [GroupModel]
}

extension ItemsModelGroup: Codable {
    enum CodibgKeys: String, CodingKey {
        case items = "items"
    }
}
