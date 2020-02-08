//
//  SwipeableCardViewProtocol.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 23/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

protocol SwipeableCardViewProtocol: AnyObject {
    func numberOfCards() -> Int
    func card(forItemAtIndex index: Int) -> SwipeableCardView
    func emptyCards() -> UIView?
}
