//
//  HomeCoordinator.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    var delegate: HomeCoordinatorDelegate!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewModel = HomeViewModel()
        homeViewModel.delegate = delegate
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([homeViewController], animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func callDetails(_ viewModel: HomeViewModel) {
        print("Test")
    }
}
