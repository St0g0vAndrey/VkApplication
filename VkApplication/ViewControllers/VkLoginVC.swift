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
    
    @IBAction func unwindToLogin (_ segue: UIStoryboardSegue) {
        SomeSessions.instance.token = ""
        SomeSessions.instance.userID = 0
        
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach {
                if $0.displayName.contains("vk") {
                    dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: [$0]) { [weak self] in
                        guard
                            let self = self,
                            let url = self.urlComponent.url
                        else { return }
                        self.vkWebKit.load(URLRequest(url: url))
                    }
                }
            }
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
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let url = urlComponent.url
        else { return }
        vkWebKit.load(URLRequest(url: url))
    }
}

extension VkLoginVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url =  navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else { return decisionHandler(.allow) }
        
        let parametrs = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String: String]()) { partialResult, params in
                var dict = partialResult
                let key = params[0]
                let value = params[1]
                dict[key] = value
                return dict
            }
        guard
            let token = parametrs["access_token"],
            let userIdString = parametrs["user_id"],
            let userId = Int(userIdString)
        else { return decisionHandler(.allow) }
        
        SomeSessions.instance.token = token
        SomeSessions.instance.userID = userId
        
        performSegue(withIdentifier: "myLogin", sender: nil)
        decisionHandler(.cancel)
    }
}
