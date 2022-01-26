//
//  UserModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class UserModel: Comparable {
    
    let username: String
    var userFamily: String
    let userPhoto: String?
    let userPhotoCollection: [String]
    
    //MARK: - Init
    init(username: String, userFamily: String, userPhoto: String, userPhotoCollection: [String]) {
        self.username = username
        self.userFamily = userFamily
        self.userPhoto = userPhoto
        self.userPhotoCollection = userPhotoCollection
    }
    
    deinit {
        
    }

    static func < (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.userFamily < rhs.userFamily
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.userFamily == rhs.userFamily
    }
}

