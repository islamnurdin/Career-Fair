//
//  MenuViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/3/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var viewVacancies: UIView!
    @IBOutlet weak var viewSchedule: UIView!
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var viewEmployers: UIView!
    @IBOutlet weak var viewContest: UIView!
    @IBOutlet weak var viewOrganizators: UIView!
    @IBOutlet weak var viewPartners: UIView!
    @IBOutlet weak var viewSponsors: UIView!
    @IBOutlet weak var viewQns: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyles()
    }
    
    private func applyStyles(){
        let yellow = UIColor(red:1.00, green:0.88, blue:0.29, alpha:1.0)
        viewVacancies.applyStyleButton()
        viewSchedule.applyStyleButton()
        viewMap.applyStyleButton()
        viewEmployers.applyStyleButton()
        viewContest.applyStyleButton()
        viewOrganizators.applyStyleButton()
        viewPartners.applyStyleButton()
        viewSponsors.applyStyleButton()
        viewQns.applyStyleButton()
        
        viewSchedule.addLeftBorderWithColor(color: yellow, width: 10.0)
        viewMap.addRightBorderWithColor(color: yellow, width: 10.0)
        viewEmployers.addLeftBorderWithColor(color: yellow, width: 10.0)
        viewContest.addRightBorderWithColor(color: yellow, width: 10.0)
        viewOrganizators.addLeftBorderWithColor(color: yellow, width: 10.0)
        viewPartners.addRightBorderWithColor(color: yellow, width: 10.0)
        viewSponsors.addLeftBorderWithColor(color: yellow, width: 10.0)
        viewQns.addRightBorderWithColor(color: yellow, width: 10.0)
    }
}
