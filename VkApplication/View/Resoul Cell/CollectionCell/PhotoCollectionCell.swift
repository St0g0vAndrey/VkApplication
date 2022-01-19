//
//  PhotoCollectionCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

final class PhotoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var countLike: UILabel!
    @IBOutlet weak var photoCollection: UIImageView!
    
    //MARK: - Cicle
    override func awakeFromNib() {
        super.awakeFromNib()
        configLabel()
        buttonAction()
    }
    
    //MARK: - Init
    func configure(photo: UIImage?) {
        self.photoCollection.image = photo
    }
    
    
    private func buttonAction() {
        switch buttonLike.isEnabled {
        case true:
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
            count += 1
            countLike.text = String(count)
        case false:
            buttonLike.setImage(UIImage(systemName: "heart"), for: .disabled)
            
        }
    }
    
    
    var count = 0
    private func configLabel () {
        
        countLike.textColor = .red
        countLike.text = String(count)
        //countLike.sizeThatFits(CGSize(width: 15.0, height: 20.0))
    }

    
}
