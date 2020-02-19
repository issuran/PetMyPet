//
//  HomeCoordinatorDelegate.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    func callDetails(_ viewModel: HomeViewModel)
    func callLogout(_ viewModel: HomeViewModel)
}
