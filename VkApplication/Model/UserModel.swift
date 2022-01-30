//
//  UserModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit
import SwiftUI

class UserModel: Comparable {
    
    let username: Name
    var userFamily: Family
    let userPhoto: Photo
    let userPhotoCollection: [String]
    
    enum Name: String {
        case Mark = "Mark"
        case Jenny = "Jenny"
        case Amanda = "Amanda"
        case Rogers = "Rogers"
        case Ariel = "Ariel"
    }
    
    enum Family: String {
        case Laletin = "Laletin"
        case Allen = "Allen"
        case Vilson = "Vilson"
        case Jones = "Jones"
        case Theron = "Theron"
    }
    
    enum Photo: String {
        case MarkPhoto = "Boy1.jpg"
        case JennyPhoto = "Woomen3.jpg"
        case AmandaPhoto = "Woomen1.jpg"
        case RogersPhoto = "Boy2.jpg"
        case ArielPhoto = "Woomen2.jpg"
    }
    
    //MARK: - Init
    init(username: Name, userFamily: Family, userPhoto: Photo, userPhotoCollection: [String]) {
        self.username = username
        self.userFamily = userFamily
        self.userPhoto = userPhoto
        self.userPhotoCollection = userPhotoCollection
    }
    
    deinit {
        
    }

    //MARK: - Function
    
    static func < (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.userFamily.rawValue < rhs.userFamily.rawValue
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.userFamily.rawValue == rhs.userFamily.rawValue
    }
}

