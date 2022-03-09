//
//  GroupModelResponse.swift
//  VkApplication
//
//  Created by Андрей Стогов on 04.03.2022.
//

import Foundation

struct GroupModelResponse {
    let groups: ItemsModel
}

extension GroupModelResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case groups = "response"
    }
}
