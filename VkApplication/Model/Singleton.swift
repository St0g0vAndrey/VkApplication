//
//  Singleton.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

final class SomeSessions {
    var token: String = ""
    var userID: Int = 0
    
    static let instance = SomeSessions()
    
    private init() {
        
    }
}
