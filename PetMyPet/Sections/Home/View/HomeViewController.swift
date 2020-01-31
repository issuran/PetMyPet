//
//  HomeViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    
    @IBAction func panView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)

        if let viewToDrag = sender.view {
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x,
                y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
        }
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.2) {
                sender.view?.center = self.view.center
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
