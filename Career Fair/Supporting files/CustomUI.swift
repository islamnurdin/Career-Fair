//
//  CustomUI.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/5/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 7)
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.1
    }
}
