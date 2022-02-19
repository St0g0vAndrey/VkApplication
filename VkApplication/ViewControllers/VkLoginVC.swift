//
//  VkLoginVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 19.02.2022.
//

import UIKit
import WebKit

class VkLoginVC: UIViewController  {

    @IBOutlet weak var vkWebKit: WKWebView! {
        didSet {
            vkWebKit.navigationDelegate = self
        }
    }
    
    private var urlComponent: URLComponents = {
       var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "oauth.vk.com"
        comp.path = "/authorize"
        comp.queryItems = [
            URLQueryItem(name: "client_id", value: "8083041"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        return comp
    }()
    
    //private let netWork = NetworkService()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let url = urlComponent.url
        else { return }
        vkWebKit.load(URLRequest(url: url))
        //netWork.featchUser()
    }

}

extension VkLoginVC: WKNavigationDelegate {
    
}
