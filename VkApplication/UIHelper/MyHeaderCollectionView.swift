//
//  MyHeaderCollectionView.swift
//  VkApplication
//
//  Created by Андрей Стогов on 31.03.2022.
//

import Foundation
import UIKit
import Kingfisher

class MyHeaderCollectionView: UICollectionReusableView {
    
    static let identifire = "myHeaderCollectionView"
    
    @IBOutlet var userPhoto: AvatarImage!
    @IBOutlet var userName: UILabel!
 
    func imageKF(_ imageUrl: String) {
        self.userPhoto.kf.setImage(with: URL(string: "\(imageUrl)"))
//        userPhoto.kf.setImage(with: URL(string: "\(imageUrl)"), placeholder: nil, options: [.transition(.fade(0.1))])
    }
    
    public func configure(image: String, name: String) {
        imageKF(image)
        self.userName.text = name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhoto.frame = bounds
        userName.frame = bounds
    }
}

