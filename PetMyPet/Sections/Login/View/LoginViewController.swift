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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        let upColor = UIColor(displayP3Red: 225/255, green: 115/255, blue: 140/255, alpha: 1.0).cgColor
        
        let middleColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        
        let downColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        
        gradientLayer.colors = [upColor, middleColor, downColor]
        /// To change gradient direction - vertical
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        layer.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.addSublayer(layer)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
