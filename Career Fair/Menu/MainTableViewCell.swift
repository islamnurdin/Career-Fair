//
//  MainTableViewCell.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/5/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: CustomView!
    
    @IBOutlet weak var label: UILabel!
    
    
    static let cellID = "MainTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillMain(index: Int) {
        if index % 2 == 0 {
            mainViewLeftConstraint.constant = frame.size.width - mainView.frame.size.width + 50
            
        } else {
            mainViewLeftConstraint.constant = -30
        }
    }
}
