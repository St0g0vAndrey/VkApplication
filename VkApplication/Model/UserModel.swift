//
//  UserModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class UserModel {
    let username: String
    let userFamily: String
    let userPhoto: UIImage
    
    init(username: String, userFamily: String, userPhoto: UIImage) {
        self.username = username
        self.userFamily = userFamily
        self.userPhoto = userPhoto
    }
    
    deinit {
        
    }
}
