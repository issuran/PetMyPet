//
//  LoginCoordinator.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 08/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewModel = LoginViewModel()
        loginViewModel.delegate = delegate
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([loginViewController], animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func callHome(_ viewModel: LoginViewModel) {
        print("Test")
    }
}
