//
//  SettingsViewModel.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 06/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

enum Sections {
    case photos     // done - SettingsImageCell
    case name       // done - SettingsTextFieldCell
    case age        // maybe - check SettingsTextFieldCell only number
    case location   // get users location
    case range      // slider
    case gender     // dropbox
}

class SettingsViewModel {
    weak var delegate: SettingsCoordinatorDelegate!
    
    var settingsTitle: [String] = ["", "Nome", "Idade", "Distancia"]
    
    func callHome() {
        delegate.callHome(self)
    }
}
