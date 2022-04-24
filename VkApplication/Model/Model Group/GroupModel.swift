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
/*
 "items": [
             {
                 "id": 15365973,
                 "name": "GeekBrains",
                 "screen_name": "geekbrainsru",
                 "is_closed": 0,
                 "type": "page",
                 "is_admin": 0,
                 "is_member": 1,
                 "is_advertiser": 0,
                 "photo_50": "https://sun1-56.userapi.com/s/v1/ig2/Z-aPt8MPvgStrmjfCwo-WPK7jrMdYoNUhCbpYgj93XAEZmeVnhMNsfnSVDzdguEzVff4BZfxcC_K87kje-d5L_n9.jpg?size=50x50&quality=95&crop=256,256,2046,2046&ava=1",
                 "photo_100": "https://sun1-56.userapi.com/s/v1/ig2/E2OXnQt1pu_KRu5vw-gB4FclFrYiQu5_tqgVXK7_oBD63eJkrUe8N53XteqLXt8Zcoafm1pY7vHw9Abztk3CI5If.jpg?size=100x100&quality=95&crop=256,256,2046,2046&ava=1",
                 "photo_200": "https://sun1-56.userapi.com/s/v1/ig2/vvEJNxL7wwc3rMDFuYD0I6XO69Wy0yoCItYM592AFaDfOpxZiqWu2r57G7WpBx6Jzh1pYf6McI2ihZTsPTeVYrR0.jpg?size=200x200&quality=95&crop=256,256,2046,2046&ava=1"
             },
 */
