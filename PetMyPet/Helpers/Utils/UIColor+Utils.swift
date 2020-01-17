//
//  UIColor+Utils.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 14/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

struct UIColorUtils {
    static let lightestPurpleColor = UIColor(hex: "#BD9EFFFF")
    static let lighterPurpleColor = UIColor(hex: "#BD66FFFF")
    static let lightPurpleColor = UIColor(hex: "#AA5CE6FF")
    static let mainColor = UIColor(hex: "#8E4DBFFF")
    static let darkPurpleColor = UIColor(hex: "#5E3380FF")
    static let darkerPurpleColor = UIColor(hex: "#2F1A40FF")
    
    static let pawPinkColor = UIColor(hex: "#DF748DFF")
    static let pawLightGreyColor = UIColor(hex: "#E9E9E9FF")
    static let pawDarkGreyColor = UIColor(hex: "#D3D2D8FF")
}
