//
//  NavigationAnimator.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

import UIKit

final class PushAnimate: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let animateTime = 1.2

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animateTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(
            translationX: source.view.bounds.width,
            y: source.view.bounds.height)
        
        UIView.animateKeyframes(withDuration: animateTime,
                                delay: 0.0,
                                options: .calculationModePaced) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                let translation = CGAffineTransform(translationX: <#T##CGFloat#>, y: <#T##CGFloat#>)
            }
        } completion: { <#Bool#> in
            <#code#>
        }

    }
    
}
