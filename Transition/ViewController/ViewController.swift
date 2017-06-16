//
//  ViewController.swift
//  Transition
//
//  Created by Supakit Thanadittagorn on 6/15/17.
//  Copyright © 2017 Supakit Thanadittagorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let zoomAnimationController = ZoomAnimationController()

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return zoomAnimationController
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return zoomAnimationController
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.transitioningDelegate = self
    }
}


