//
//  Color+Extension.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    func colorWithHexString(hex:String)->UIColor {
        let alpha:CGFloat = 1
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        return UIColor(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: alpha)
    }
    
}
