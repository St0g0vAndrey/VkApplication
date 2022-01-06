//
//  User.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import Foundation

final class UserInterfice {
    var name: String
    var family: String
    var age: Int
    
    init(name: String, family: String, age: Int) {
        self.name = name
        self.family = family
        self.age = age
    }
    
    deinit {
        
    }
    
}
