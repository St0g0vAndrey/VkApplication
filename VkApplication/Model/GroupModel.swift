//
//  GroupModel.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

class GroupModel {
    let groupName: Name
    let groupEmblem: Emblem
    
    enum Name: String {
        case BarberHop = "BarberShop"
        case Pizza = "Gold Pizza"
        case Komsomolsk = "Komsomolsk-in-Amure"
    }
    
    enum Emblem: String {
        case BarberHop = "BarberShop.jpg"
        case Pizza = "Pizza.jpg"
        case Komsomolsk = "Kom-in-Amure.jpg"
    }
    
    init(groupName: Name, groupEmblem: Emblem) {
        self.groupName = groupName
        self.groupEmblem = groupEmblem
    }
    
    deinit {
        
    }
}
