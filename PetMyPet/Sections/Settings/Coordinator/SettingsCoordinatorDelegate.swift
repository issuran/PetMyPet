//
//  SettingsCoordinatorDelegate.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 06/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

protocol SettingsCoordinatorDelegate: AnyObject {
    func callHome(_ viewModel: SettingsViewModel)
}
