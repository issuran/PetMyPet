//
//  SwipeableCardView.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 23/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SwipeableCardView: UIView {
    
    @IBOutlet weak var contentView: UIView!    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var okImageView: UIImageView!
    @IBOutlet weak var noImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
    }
}
