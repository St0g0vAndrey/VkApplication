//
//  PhotoCollection.swift
//  VkApplication
//
//  Created by Андрей Стогов on 10.03.2022.
//

import Foundation
import SwiftUI

struct PhotoCollection {
    let photo: String
    let height: Int
    let width: Int
}

extension PhotoCollection: Codable {
    enum CodingKeys: String, CodingKey {
        case photo = "url"
        case height
        case width
    }
}
