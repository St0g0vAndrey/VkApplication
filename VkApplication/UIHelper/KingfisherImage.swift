//
//  KingfisherImage.swift
//  VkApplication
//
//  Created by Андрей Стогов on 25.03.2022.
//

import Foundation
import Kingfisher

func KingfisherImageView(url: URL) -> KFImage {
    return UIImageView.kf.setImage(with: url)
    
}
