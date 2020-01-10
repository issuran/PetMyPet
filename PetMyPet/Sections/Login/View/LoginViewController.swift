//
//  LoginViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 08/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientBackground()
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createGradientBackground() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        let leftColor = UIColor(displayP3Red: 253/255, green: 197/255, blue: 83/255, alpha: 1.0).cgColor
        
        let centerColor = UIColor(displayP3Red: 246/255, green: 133/255, blue: 99/255, alpha: 1.0).cgColor
        
        let rightColor = UIColor(displayP3Red: 237/255, green: 75/255, blue: 115/255, alpha: 1.0).cgColor
        
        layer.colors = [rightColor, centerColor, leftColor]
        /// To change gradient direction - vertical
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        layer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(layer)
    }
}
