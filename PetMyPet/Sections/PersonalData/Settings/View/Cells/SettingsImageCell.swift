//
//  SettingsImageCell.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 20/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SettingsImageCell: UITableViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgOne: PMPButton!
    @IBOutlet weak var imgTwo: PMPButton!
    @IBOutlet weak var imgThree: PMPButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
