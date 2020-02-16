//
//  HomeViewModel.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

enum MenuOption: Int {
    case perfil = 0
}

class HomeViewModel {
    weak var delegate: HomeCoordinatorDelegate!
    
    let testArray: [String] = ["First", "Second", "Third"]
    
    var current = 0
    
    func numberOfCards() -> Int {
        return testArray.count
    }
    
    func cardImage(forItemAtIndex index: Int) -> UIImage? {
        if canMoveToNextCard() {
            let image = #imageLiteral(resourceName: testArray[index])
            return image
        } else {
            return nil
        }
    }
    
    func canMoveToNextCard() -> Bool {
        if current < numberOfCards() {
            return true
        } else {
            return false
        }
    }
    
    func callDetails() {
        delegate.callDetails(self)
    }
}
