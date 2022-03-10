//
//  UserResponse.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import UIKit
import SwiftUI

struct UserResponse {
    let user: ItemsModelUser
}
 
extension UserResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case user = "response"
    }
}
