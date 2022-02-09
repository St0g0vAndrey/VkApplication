//
//  NewsTableCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 30.01.2022.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet weak var photoNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var groupEmblem: AvatarImage!
    
    @IBOutlet weak var buttonCountLike: UIButton!
    @IBOutlet weak var chatText: UIButton!
    @IBOutlet weak var shareText: UIButton!
    @IBOutlet weak var viewsCountText: UIButton!
    
    var textCount: Int = 0
    
    @IBAction func sharePressButton(_ sender: UIButton) {
    }
    
    @IBAction func chatPressButton(_ sender: UIButton) {
    }
    
    @IBAction func buttonPressLike(_ sender: UIButton) {
        
        animateLike()
        switch buttonCountLike.isEnabled {
            case true:
                buttonCountLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                
            if ( textCount == 0) {
                textCount += 1
                buttonCountLike.setTitle("\(textCount)", for: .normal)
            } else {
                textCount -= 1
                buttonCountLike.setImage(UIImage(systemName: "heart"), for: .normal)
                buttonCountLike.setTitle("\(textCount)", for: .normal)
            }
            case false:
                break
    }
}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonCountLike.setTitle("\(textCount)", for: .normal)
        chatText.setTitle("\(textCount)", for: .normal)
        shareText.setTitle("\(textCount)", for: .normal)
        viewsCountText.setTitle("\(textCount)", for: .normal)
    }
    
    func configure(photoNews: UIImage, titleNews: String, nameGroup: String, groupEmblem: UIImage) {
        self.photoNews.image = photoNews
        self.titleNews.text = titleNews
        self.nameGroup.text = nameGroup
        self.groupEmblem.image = groupEmblem
    }
    
    let duration = 2.0
    let delay = 0.1
    let rotationAngel = 1.5
    
    func animateLike() {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [
                .curveEaseInOut,
            ]) { [self] in
                self.buttonCountLike.transform = CGAffineTransform(rotationAngle: self.rotationAngel)
            } completion: { _ in
                self.buttonCountLike.transform = .identity
            }
    }
    
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
}
