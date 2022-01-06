//
//  GroupModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class GroupModel {
    let groupName: String
    let groupEmblem: UIImage
    
    
    init(groupName: String, groupEmblem: UIImage) {
        self.groupName = groupName
        self.groupEmblem = groupEmblem
    }
    
    
    deinit {
        
    }
}
