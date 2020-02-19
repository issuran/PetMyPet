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
    var settingsViewModel: SettingsViewModel!
    var settingsViewController: SettingsViewController!
    
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
        loginCoordinator = nil
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.delegate = self
        homeCoordinator.start()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func callDetails(_ viewModel: HomeViewModel) {
        settingsViewModel = SettingsViewModel()
        settingsViewModel.delegate = self
        settingsViewController = SettingsViewController(viewModel: settingsViewModel)
        homeCoordinator.navigationController
            .pushViewControllerFromLeft(controller: settingsViewController)
    }
    
    func callLogout(_ viewModel: HomeViewModel) {
        homeCoordinator = nil
        self.start()
    }
}

extension AppCoordinator: SettingsCoordinatorDelegate {
    func callHome(_ viewModel: SettingsViewModel) {
        settingsViewController = nil
        settingsViewModel = nil
        navigationController.popViewControllerToLeft()
    }
}
