//
//  NewsCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 26.04.2022.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var news: UIImageView!
    
    
    func configure(_ newsPost: String) {
        self.news.kf.setImage(with: URL(string: newsPost))
    }
    
}
