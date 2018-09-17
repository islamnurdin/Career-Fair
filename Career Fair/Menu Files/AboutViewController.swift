//
//  AboutViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/7/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutDescrp: UILabel!
    var about = [About]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEmployerData {
            self.view.reloadInputViews()
        }
        
    }
    
    func getEmployerData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/about/")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.about = try JSONDecoder().decode([About].self, from: data!)
                
                for item in self.about {
                    self.navigationItem.title = item.title
                    self.aboutDescrp.text = item.description
                }
                
                DispatchQueue.main.async {
                    completed()
                }
            }
            catch let e{
                print(e)
            }
        }
    }
    
}
