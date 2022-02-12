//
//  CustomNavigateController.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

import UIKit

final class CustomNavigateController: UINavigationController, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return
        case .pop:
            return
        default:
            return nil
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        <#code#>
    }
}
