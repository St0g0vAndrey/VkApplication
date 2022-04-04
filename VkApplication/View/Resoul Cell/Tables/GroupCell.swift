//
//  GroupCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 02.01.2022.
//

import UIKit
import Kingfisher

final class GroupCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: AvatarImage!
    @IBAction func buttonImageProcess(_ sender: UIButton) {
        animate()
    }
    
    func imageKF (_ url: String) {
        self.groupImage.kf.setImage(with: URL(string: "\(url)"), placeholder: nil, options: [.transition(.fade(0.1))])
    }
    
    func configure(emblem: String, name: String){
        imageKF(emblem)
        self.groupName.text = name
    }
    
    let duration = 1.7
    let delay = 0.2
    
    func animate() {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.6 ) {
                self.groupImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            } completion: { _ in
                self.groupImage.transform = .identity
            }

    }
}
