//
//  NavigationViewController+Extension.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 16/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

extension UINavigationController {
    func pushViewControllerFromLeft(controller: UIViewController) {
        let transition =  CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        pushViewController(controller, animated: false)
    }
    
    func popViewControllerToLeft() {
        let transition =  CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        popViewController(animated: false)
    }
}
