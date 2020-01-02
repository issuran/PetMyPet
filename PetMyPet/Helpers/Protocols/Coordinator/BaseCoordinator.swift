//
//  BaseCoordinator.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

protocol BaseCoordinator {
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
}

extension BaseCoordinator {
    func start() {}
}
