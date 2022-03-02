//
//  Singleton.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

class SomeSessions {
    var token: String = ""
    var userID: Int = 0
    
    static var instance = SomeSessions()
    
    private init() {
        
    }
}
