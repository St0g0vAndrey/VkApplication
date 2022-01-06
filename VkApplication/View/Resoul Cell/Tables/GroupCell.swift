//
//  GroupCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 02.01.2022.
//

import UIKit

final class GroupCell: UITableViewCell {


    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    func configure(emblem: UIImage, name: String){
        self.groupImage.image = emblem
        self.groupName.text = name
        
    }
}
