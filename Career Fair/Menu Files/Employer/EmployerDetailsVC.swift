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
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyDetails: UITextView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = employer?.full_name
        companyName.text = employer?.full_name
        companyDetails.text = employer?.description
        
        let urlString = employer?.logo_url
        let url = URL(string: urlString!)
        companyImage.downloadedFrom(url: url!)
        companyImage.applyStylesToImage()

    }
}
