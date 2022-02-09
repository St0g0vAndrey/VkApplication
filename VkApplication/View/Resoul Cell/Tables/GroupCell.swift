//
//  GroupCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 02.01.2022.
//

import UIKit

final class GroupCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: AvatarImage!
    @IBAction func buttonImageProcess(_ sender: UIButton) {
        animate()
    }
    
    func configure(emblem: UIImage, name: String){
        self.groupImage.image = emblem
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
