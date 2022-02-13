//
//  NavigationAnimator.swift
//  VkApplication
//
//  Created by Андрей Стогов on 13.02.2022.
//

import UIKit
import SwiftUI

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
            translationX: source.view.frame.width,
            y: source.view.frame.height)
        
        UIView.animateKeyframes(
            withDuration: animateTime,
            delay: 0.0, options: .calculationModeCubic) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                    let translation = CGAffineTransform(translationX: 0.0, y: source.view.frame.maxY)
                    let scale = CGAffineTransform(rotationAngle: -0.8)
                    source.view.transform = translation.concatenating(scale)
                    }
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.45) {
                    let translation = CGAffineTransform(translationX: 0.0, y: source.view.frame.maxY)
                    let scale = CGAffineTransform(rotationAngle: -0.8)
                    destination.view.transform = translation.concatenating(scale)
                    }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                    destination.view.transform = .identity
                    }
            } completion: { isComplete in
                if isComplete && !transitionContext.transitionWasCancelled {
                    source.view.transform = .identity
            }
                transitionContext.completeTransition(isComplete && !transitionContext.transitionWasCancelled)
        }
    }
}

final class PopAnimate: NSObject, UIViewControllerAnimatedTransitioning {
    private let animateTime = 1.2

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animateTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.insertSubview(destination.view, belowSubview: source.view)
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(
            translationX: source.view.bounds.width,
            y: 0.0).concatenating(CGAffineTransform(
                translationX: 0.0,
                y: 0.0))
        
        UIView.animateKeyframes(
            withDuration: animateTime,
            delay: 0.0, options: .calculationModePaced) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                    let translation = CGAffineTransform(translationX: 0.0, y: source.view.frame.maxY)
                    let scale = CGAffineTransform(rotationAngle: -0.8)
                    source.view.transform = translation.concatenating(scale)
                    }
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.45) {
                    let translation = CGAffineTransform(translationX: 0.0, y: source.view.frame.maxY)
                    let scale = CGAffineTransform(rotationAngle: -0.8)
                    destination.view.transform = translation.concatenating(scale)
                    }
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                    destination.view.transform = .identity
                    }
            } completion: { isComplete in
                if isComplete && !transitionContext.transitionWasCancelled {
                    source.view.transform = .identity
            }

                transitionContext.completeTransition(isComplete && !transitionContext.transitionWasCancelled)
        }
    }
}
