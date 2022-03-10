//
//  UserPhoto.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct UserPhoto {
    let photo: String
}

extension UserPhoto: Codable {
    enum CodingKeys: String, CodingKey {
        case photo = "url"
    }
}
/*
 {
     "response": {
         "count": 12,
         "items": [
             {
                 "album_id": -6,
                 "date": 1335639422,
                 "id": 285389585,
                 "owner_id": 137603461,
                 "post_id": 255,
                 "sizes": [
                     {
                         "height": 130,
                         "url": "https://sun9-45.userapi.com/impf/c10941/v10941461/3b9/bHHAbXzxeLY.jpg?size=87x130&quality=96&sign=cea7f1680f69fbe5ae64719670f92f22&c_uniq_tag=TMkD-lZIzuj5udczDvyBQm8OaLX79_3ILqwZ7a0rfb4&type=album",
                         "type": "m",
                         "width": 87
   
 */
