//
//  NewsPost.swift
//  VkApplication
//
//  Created by Андрей Стогов on 30.01.2022.
//

import Foundation
import UIKit

final class NewsPost: GroupModel {
    var photoNews: String
    var titlePost: String
    
    
    init(groupName: Name, groupEmblem: Emblem, photoNews: String, titlePost: String) {
        self.photoNews = photoNews
        self.titlePost = titlePost
        super.init(groupName: groupName, groupEmblem: groupEmblem)
    }
    
    deinit {
        
    }
}
