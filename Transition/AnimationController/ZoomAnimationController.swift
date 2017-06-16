///
//  ZoomAnimationController.swift
//  Transition
//
//  Created by Supakit Thanadittagorn on 6/15/17.
//  Copyright © 2017 Supakit Thanadittagorn. All rights reserved.
//

import UIKit

class ZoomAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if  let fromController = transitionContext.viewController(forKey: .from),
            let toController = transitionContext.viewController(forKey: .to) {

            let isDismiss = toController.presentedViewController == fromController

            if !isDismiss, let snapshot = toController.view.snapshotView(afterScreenUpdates: true) {

                snapshot.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                snapshot.center = fromController.view.center

                containerView.addSubview(toController.view)
                containerView.addSubview(snapshot)
                toController.view.isHidden = true

                UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseIn, animations: {
                    snapshot.transform = CGAffineTransform.identity
                }, completion: { (complete) in
                    toController.view.isHidden = false
                    snapshot.removeFromSuperview()
                    transitionContext.completeTransition(complete)
                })
            } else {
                if let snapshot = fromController.view.snapshotView(afterScreenUpdates: true) {

                    containerView.addSubview(toController.view)
                    containerView.addSubview(snapshot)

                    UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseIn, animations: {
                        snapshot.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                        snapshot.alpha = 0
                    }, completion: { (complete) in
                        snapshot.removeFromSuperview()
                        transitionContext.completeTransition(complete)
                    })
                }
            }
        }
    }
}

