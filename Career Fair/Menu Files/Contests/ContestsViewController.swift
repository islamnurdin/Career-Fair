//
//  ContestsViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/17/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class ContestsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Конкурсы"
    }

    @IBAction func takePartInterview(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/e/1FAIpQLSefttaSmJoYDb5eyyGClHGeXeRWKs2NIu7NKyTjXg0nNDVhUQ/viewform"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func takePartCV(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/e/1FAIpQLSd8R72J-i6fA2frwliEtyPRNf1KcbLJ69Z3-msrW3bOW5-JUA/viewform?usp=send_form"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func aboutFest(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/1_1-cPUHE8_nA6MxcjjhDY6_6nGEQboaGhycYtc9N1q8/viewform?edit_requested=true"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
