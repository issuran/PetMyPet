//
//  LoginViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 08/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: PMPButton!
    
    @IBOutlet weak var userTextField: PMPTextField!
    @IBOutlet weak var passwordTextField: PMPTextField!
    
    var viewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        createGradientBackground()
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
//        let upColor = UIColorUtils.darkPurpleColor?.cgColor ?? UIColor.white.cgColor
        
//        let downColor = UIColorUtils.lightestPurpleColor?.cgColor ?? UIColor.white.cgColor
        
        let upColor = UIColor(hex: "#E0D8E9FF")?.cgColor
        let downColor = UIColor(hex: "#ECECECFF")?.cgColor
        
        gradientLayer.colors = [upColor, downColor]
        /// To change gradient direction - vertical
//        layer.startPoint = CGPoint(x: 0, y: 0)
//        layer.endPoint = CGPoint(x: 1, y: 1)
//        view.layer.addSublayer(layer)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func performLogin(_ sender: Any) {
        viewModel?.callHome()
    }
    
}
