//
//  PhotoCollectionCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

final class PhotoCollectionCell: UICollectionViewCell {

    var numbertLike: Int = 0
    var isLicked: Bool = false
    
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var photoCollection: UIImageView!
    @IBAction func clickToLike(_ sender: Any) {
        
        switch buttonLike.isEnabled {
        case true:
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            if (numbertLike == 0) {
                numbertLike += 1
                buttonLike.setTitle("\(numbertLike)", for: .normal)
            } else {
                numbertLike -= 1
                buttonLike.setTitle("\(numbertLike)", for: .normal)
                buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        case false:
         //  buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
            break
            
        }
    }
    
    //MARK: - Cicle
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonLike.setTitle("\(numbertLike)", for: .normal)
    }
    
    //MARK: - Init
    func configure(photo: UIImage?) {
        self.photoCollection.image = photo
    }

}
