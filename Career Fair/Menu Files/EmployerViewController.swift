//
//  EmployerViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/10/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class EmployerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let myImages: [UIImage] = [#imageLiteral(resourceName: "logo"),#imageLiteral(resourceName: "about"), #imageLiteral(resourceName: "intro_logo"),#imageLiteral(resourceName: "test-image")]
    let employers = [Employer]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployerDetailsVC {
            destination.employer = employers[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
}

extension EmployerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployerViewController", for: indexPath)
        cell.textLabel?.text = "eeeEe"
        cell.imageView?.image = myImages[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
}
