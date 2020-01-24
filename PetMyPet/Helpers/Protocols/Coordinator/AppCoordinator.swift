//
//  AppCoordinator.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var navigationController: UINavigationController
    
    // Login
    var loginCoordinator: LoginCoordinator!
    
    // Home
    var homeCoordinator: HomeCoordinator!
    
    // Settings
    var settingsCoordinator: SettingsCoordinator!
    
    required init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.delegate = self
        loginCoordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func callHome(_ viewModel: LoginViewModel) {
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
}
