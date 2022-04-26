//
//  GroupModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit
import SwiftUI

struct GroupModel {
    let idGroup: Int
    let nameGroups: String
    let emblemGroup: String
}

extension GroupModel: Codable {
    enum CodingKeys: String, CodingKey {
        case idGroup = "id"
        case nameGroups = "name"
        case emblemGroup = "photo_50"
    }
}
