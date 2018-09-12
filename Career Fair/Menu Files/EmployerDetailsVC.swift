//
//  EmployerDetailsVC.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/10/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class EmployerDetailsVC: UIViewController {

    var employer: Employer?
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyDescription: UILabel!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
