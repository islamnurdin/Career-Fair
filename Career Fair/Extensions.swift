//
//  Extensions.swift
//  Career Fair
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

extension UIView {
    func applyStyleButton() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 7.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 7
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.width - 1, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
