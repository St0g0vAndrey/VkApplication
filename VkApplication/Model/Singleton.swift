//
//  Singleton.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

final class SomeSessions {
    var token: String = ""
    let userID: Int = 8083041
    
    static let instance = SomeSessions()
    
    private init() {
        
    }
}
