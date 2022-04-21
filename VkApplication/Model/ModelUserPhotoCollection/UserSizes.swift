//
//  UserSizes.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation

struct UserSizes {
    let albumId: Int
    let sizes: [PhotoCollection]
}

extension UserSizes: Codable {
    enum CodingKeys: String, CodingKey {
        case sizes = "sizes"
        case albumId = "album_id"
    }
}
/*
 {
     "response": {
         "count": 615,
         "items": [
             {
                 "album_id": 279697457,
                 "date": 1640974660,
                 "id": 457244750,
                 "owner_id": 138933897,
                 "sizes": [
                     {
                         "height": 130,
                         "url": "https://sun9-24.userapi.com/impg/jF737g1_Ftizq3skxO4MPInd8VpdH2BpCS3TlQ/vWbswoxbZes.jpg?size=73x130&quality=96&sign=1781eedd148b88cadebe08bcf25bb86f&c_uniq_tag=q8Vj1eSD1ZfOcZi8SgEoyfe9Gd-UATS409ypjUT_bjk&type=album",
                         "type": "m",
                         "width": 73
                     },
                     {
                         "height": 231,
                         "url": "https://sun9-24.userapi.com/impg/jF737g1_Ftizq3skxO4MPInd8VpdH2BpCS3TlQ/vWbswoxbZes.jpg?size=130x231&quality=96&sign=0bce36baaeca135aeb5f7216306d659e&c_uniq_tag=udPJrE7p3s7jwnOodktbz8B0VVckOre8MALy-bVjVgw&type=album",
                         "type": "o",
                         "width": 130
                     },
                     {
                         "height": 355,
                         "url": "https://sun9-24.userapi.com/impg/jF737g1_Ftizq3skxO4MPInd8VpdH2BpCS3TlQ/vWbswoxbZes.jpg?size=200x356&quality=96&sign=d364973cbc72945cb71a8cde3b3ab17b&c_uniq_tag=d-X1PVR_APC3ZMaRgig7A1zQGYV-0QJ-bsJkG8_9sAE&type=album",
                         "type": "p",
                         "width": 200
                     },
                     {
                         "height": 569,
                         "url": "https://sun9-24.userapi.com/impg/jF737g1_Ftizq3skxO4MPInd8VpdH2BpCS3TlQ/vWbswoxbZes.jpg?size=320x569&quality=96&sign=c29661a6d536e19e2522c92c45f72af0&c_uniq_tag=nLhsGwSRRSBjuaJXBnu73yUDDuNI-mJrAUmujWyU_H8&type=album",
                         "type": "q",
                         "width": 320
                     },
                     {
                         "height": 900,
                         "url": "https://sun9-24.userapi.com/impg/jF737g1_Ftizq3skxO4MPInd8VpdH2BpCS3TlQ/vWbswoxbZes.jpg?size=510x900&quality=96&crop=0,0,900,1588&sign=f15142ce12962dc483b98457d2cfe94a&c_uniq_tag=xiyE2Lq2a0UHI7wl3dUquCn_Kp1jEQ-OK5jYxn4Ww3w&type=album",
                         "type": "r",
                         "width": 510
                     },
   
 */
