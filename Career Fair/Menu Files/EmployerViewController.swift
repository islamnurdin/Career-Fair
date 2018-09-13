//
//  EmployerViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/10/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import Alamofire

class EmployerViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let myImages: [UIImage] = [#imageLiteral(resourceName: "about"), #imageLiteral(resourceName: "test-image"), #imageLiteral(resourceName: "test-image"),#imageLiteral(resourceName: "test-image"),#imageLiteral(resourceName: "test-image"),#imageLiteral(resourceName: "test-image"),#imageLiteral(resourceName: "test-image"),#imageLiteral(resourceName: "test-image")]
    var employers = [Employer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEmployeData {
            self.tableView.reloadData()
        }

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getEmployeData(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.employers = try JSONDecoder().decode([Employer].self, from: data!)
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

extension EmployerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployerViewController", for: indexPath)
        cell.textLabel?.text = employers[indexPath.row].localized_name
        cell.detailTextLabel?.text = employers[indexPath.row].name
        cell.imageView?.image = myImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "employerDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployerDetailsVC {
            destination.employer = employers[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
