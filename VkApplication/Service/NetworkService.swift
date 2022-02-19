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
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        constructor.path = ""
        return constructor
    }()
    
    
    
    func featchUser() {
        
        var consstructor = urlConstructor
        
        consstructor.queryItems = [
            URLQueryItem(name: "appid", value: "\(SomeSessions.instance.userID)")
        ]
        
        guard let url = url else { return }
        
        let task = mySession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard error == nil,
                    let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            print (json)
        }
        task.resume()
    }
}
