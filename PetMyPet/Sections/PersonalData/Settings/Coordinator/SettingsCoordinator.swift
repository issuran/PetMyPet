//
//  SettingsCoordinator.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 06/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SettingsCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    var delegate: SettingsCoordinatorDelegate!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let settingsViewModel = SettingsViewModel()
        settingsViewModel.delegate = delegate
        let settingsViewController = SettingsViewController(viewModel: settingsViewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([settingsViewController], animated: true)
    }
}

extension SettingsCoordinator: SettingsCoordinatorDelegate {
    func callHome(_ viewModel: SettingsViewModel) {
        print("Test")
    }
}
