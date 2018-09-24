//
//  SurveyViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/24/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Опросы"
    }

    @IBAction func firstSurveyPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/1AIxuIWDPeD3MkX6frWMJVjE3_4msiwo4sUZuUhzsN_0/viewform?edit_requested=true"
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func secondSurveyPressed(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/1oUAC3HWO73MbhE0-YLgMYm7co4i_8HC6GehZlqIuDLE/viewform?edit_requested=true"
        navigationController?.pushViewController(vc, animated: true)
    }
}
