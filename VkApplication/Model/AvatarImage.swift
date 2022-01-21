//
//  AvatarImage.swift
//  VkApplication
//
//  Created by Андрей Стогов on 21.01.2022.
//

import UIKit

class AvatarImage: UIImageView {

    @IBInspectable var borderColor: UIColor = .green
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var shadowColor: UIColor = .red
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3.0, height: 3.0)
    @IBInspectable var shadowOpacity: Float = 0.8
    @IBInspectable var shadowRadius: CGFloat = 10
    @IBInspectable var shadowBlur: CGFloat = 20.0
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = .black
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    var emblemView = UIImageView()
    let shadowView = UIView()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        emblemView.frame = rect
        emblemView.layer.cornerRadius = shadowRadius
        emblemView.clipsToBounds = true
        emblemView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)

        shadowView.frame = rect
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowOffset = shadowOffset
        shadowView.layer.shadowRadius = shadowBlur
        shadowView.addSubview(emblemView)
        self.addSubview(shadowView)
    }
    
    
}


    
   
