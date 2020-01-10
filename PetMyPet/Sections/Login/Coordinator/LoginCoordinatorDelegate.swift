//
//  LoginCoordinatorDelegate.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 08/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

protocol LoginCoordinatorDelegate: AnyObject {
    func callHome(_ viewModel: LoginViewModel)
}
