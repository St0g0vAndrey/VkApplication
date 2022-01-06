//
//  PhotoCollectionCell.swift
//  VkApplication
//
//  Created by Андрей Стогов on 06.01.2022.
//

import UIKit

final class PhotoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var photoCollection: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(photo: UIImage?) {
        self.photoCollection.image = photo
    }
    
}
