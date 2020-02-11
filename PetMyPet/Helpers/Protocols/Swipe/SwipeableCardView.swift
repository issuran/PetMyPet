//
//  SwipeableCardView.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 23/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

protocol CustomSwipeableButtonsProtocol {
    func yesClicked()
    func noClicked()
}

class SwipeableCardView: UIView {
    
    @IBOutlet weak var contentOfView: UIView!
    @IBOutlet weak var animalImageView: UIImageView!
    
    @IBOutlet weak var okButton: PMPButton!
    @IBOutlet weak var noButton: PMPButton!
    
    @IBOutlet weak var feedbackImageView: UIImageView!
    
    var delegate: CustomSwipeableButtonsProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SwipeableCardView",
                                 owner: self,
                                 options: nil)
        addSubview(contentOfView)
        contentOfView.frame = self.bounds
        contentOfView.autoresizingMask = [.flexibleHeight,
                                        .flexibleWidth]
        
        //This creates the shadows and modifies the cards a little bit
        self.contentOfView.layer.cornerRadius = 5.0
        self.contentOfView.layer.borderWidth = 1.0
        self.contentOfView.layer.borderColor = UIColor.clear.cgColor
        self.contentOfView.layer.masksToBounds = true
        
        self.contentOfView.layer.shadowColor = UIColor.gray.cgColor
        self.contentOfView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.contentOfView.layer.shadowRadius = 4.0
        self.contentOfView.layer.shadowOpacity = 0.7
        self.contentOfView.layer.masksToBounds = false
    }
    
    @IBAction func noAction(_ sender: PMPButton) {
        self.delegate?.noClicked()
    }
    
    @IBAction func yesAction(_ sender: PMPButton) {
        self.delegate?.yesClicked()
    }
}
