//
//  NetworkService.swift
//  VkApplication
//
//  Created by Андрей Стогов on 18.02.2022.
//

import Foundation

final class NetworkService {
    
//    let url = URL(string: "https://api.vk.com/groups.get?user_id=705889354&access_token=8083041&v=5.131")
    
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
        
        var consstructor = urlConstructor
        consstructor.queryItems = [
            URLQueryItem(name: "access_token", value: "\(SomeSessions.instance.token)"),
            URLQueryItem(name: "user_id", value: "\(SomeSessions.instance.userID)")
        ]
        
        guard
//            let url = url,
            var request = URLRequest(url: urlConstructor.url!)
        else { return }
        
        request.httpMethod = "POST"
        
        let task = mySession.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard error == nil,
                    let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: JSONSerialization.ReadingOptions.allowFragments)
            print (json)
        }
        task.resume()
    }
}
