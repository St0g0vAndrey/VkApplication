//
//  AvatarImage.swift
//  VkApplication
//
//  Created by Андрей Стогов on 21.01.2022.
//

import UIKit

class AvatarImage: UIImageView {

    @IBInspectable var borderColor: UIColor = .darkGray
    @IBInspectable var borderWidth: CGFloat = 2.0
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

class AvatarShadow: UIView {
    
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: -3)
    @IBInspectable var shadowOpacity: Float = 0.8
    @IBInspectable var shadowRadius: CGFloat = 10
    
    override func awakeFromNib() {
        self.backgroundColor = .clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    var logoView = UIImageView()
    let shadowView = UIView()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        logoView.frame = rect
        logoView.layer.cornerRadius = shadowRadius
        logoView.clipsToBounds = true
        logoView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)

        shadowView.frame = rect
        shadowView.clipsToBounds = false
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowOffset = shadowOffset
        //shadowView.layer.shadowRadius = shadowBlur
        shadowView.layer.shadowPath = UIBezierPath(
            roundedRect: shadowView.bounds,
            cornerRadius: shadowRadius).cgPath
        
        shadowView.addSubview(logoView)
        self.addSubview(shadowView)
    }
}
