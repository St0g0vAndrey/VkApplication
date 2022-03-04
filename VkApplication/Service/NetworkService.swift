//
//  NetworkService.swift
//  VkApplication
//
//  Created by Андрей Стогов on 18.02.2022.
//

import Foundation

final class NetworkService {
    
    let configurate = URLSessionConfiguration.default
    lazy var mySession = URLSession(configuration: configurate)
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = "/method/groups.get"
        return constructor
    }()
    
    func featchUser() {
        
        var constructor = urlConstructor
        constructor.queryItems = [
            URLQueryItem(name: "access_token", value: SomeSessions.instance.token),
            URLQueryItem(name: "user_ids", value: "\(SomeSessions.instance.userID)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard
            let url = constructor.url
        else { return }
        
        let task = mySession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard error == nil,
                    let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: JSONSerialization.ReadingOptions.allowFragments)
            print (json ?? "")
        }
        task.resume()
    }
}
