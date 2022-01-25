//
//  UserModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class UserModel {
    let username: String
    let userPhoto: String?
    let userPhotoCollection: [String]
    
    init(username: String, userPhoto: String, userPhotoCollection: [String]) {
        self.username = username
        self.userPhoto = userPhoto
        self.userPhotoCollection = userPhotoCollection
    }
    
    deinit {
        
    }
}
