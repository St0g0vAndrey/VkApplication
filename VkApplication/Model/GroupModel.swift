//
//  GroupModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class GroupModel {
    let groupName: String?
    let groupEmblem: String
    
    
    init(groupName: String, groupEmblem: String) {
        self.groupName = groupName
        self.groupEmblem = groupEmblem
    }
    
    
    deinit {
        
    }
}
