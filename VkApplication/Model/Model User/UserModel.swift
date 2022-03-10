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

/*
 {
     "response": {
         "count": 1,
         "items": [
             {
                 "id": 137603461,
                 "first_name": "Сергей",
                 "last_name": "Илистратов",
                 "can_access_closed": true,
                 "is_closed": true,
                 "photo_50": "https://sun1-22.userapi.com/s/v1/if1/b_OEwaZ_mRw-DP5_omgm2JhcZAbFR2_ABp33aNm0TVbeW4xtrkcrb7xiC_orQYj_rgGxDg.jpg?size=50x50&quality=96&crop=0,1,1535,1535&ava=1",
                 "track_code": "c35dc8ca5vuYj8NGnNJvomKByklc6uCvsDHVW4sgYa1TJkFgnKiLkMC4_ESZ0j-nUX4-9pyBk7upPcI17w"
             }
         ]
     }
 }
 */
