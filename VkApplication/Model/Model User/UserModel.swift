//
//  UserModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit
import SwiftUI

struct UserModel {
    
    let userId: Int
    let userName: String
    let userFamily: String
    let userPhoto: String
    
    }
//MARK: - Extension
extension UserModel: Comparable {

        static func < (lhs: UserModel, rhs: UserModel) -> Bool {
            return lhs.userFamily < rhs.userFamily
        }

        static func == (lhs: UserModel, rhs: UserModel) -> Bool {
            return lhs.userFamily == rhs.userFamily
        }
    }
    
extension UserModel: Codable {
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case userName = "first_name"
        case userFamily = "last_name"
        case userPhoto = "photo_50"
    }
    
}

