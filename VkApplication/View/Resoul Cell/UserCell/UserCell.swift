//
//  UserCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 26.04.2022.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet weak var userPhoto: AvatarImage!
    @IBOutlet weak var userName: UILabel!

    }

    func imageKF (_ url: String){
        self.userPhoto.kf.setImage(with: URL(string: "\(url)"), placeholder: nil, options: [.transition(.fade(0.1))])
    }
    
    func configure(_ users: UserModel){
        imageKF(users.userPhoto)
        self.userName.text = "\(users.userFamily) \(users.userName)"
    }
}
