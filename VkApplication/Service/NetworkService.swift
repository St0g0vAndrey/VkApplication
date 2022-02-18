//
//  NetworkService.swift
//  VkApplication
//
//  Created by Андрей Стогов on 18.02.2022.
//

import Foundation

final class NetworkService {
    
    let url = URL(string: "")
    
    let configurate = URLSessionConfiguration.default
    lazy var mySession = URLSession(configuration: configurate)
    
    func featchUser() {
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        
        guard
            let url = url else { return }
        let task = mySession.dataTask(with: url) { data, response, error in
            print (data, response, error)
        }
        task.resume()
    }
}
