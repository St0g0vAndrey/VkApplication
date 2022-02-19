//
//  VkLoginVC.swift
//  VkApplication
//
//  Created by Андрей Стогов on 19.02.2022.
//

import UIKit

class VkLoginVC: UIViewController {

    
    @IBOutlet weak var vkWebKit: WKWebView!
    
    private let netWork = NetworkService()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        netWork.featchUser()
    }
    

}
