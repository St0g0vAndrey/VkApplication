//
//  ItemsModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 09.03.2022.
//

import Foundation

struct ItemsModel {
    let items: [GroupModel]
}

extension ItemsModel: Codable {
    enum CodibgKeys: String, CodingKey {
        case items = "items"
    }
}
