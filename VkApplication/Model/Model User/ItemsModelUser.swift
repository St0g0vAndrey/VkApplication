//
//  ItemsModelUser.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import UIKit
import SwiftUI

struct ItemsModelUser {
    let items: [UserModel]
}

extension ItemsModelUser: Codable {
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
