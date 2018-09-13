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
    
    var employers: Employer?
    var employer = [Employer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEmployeData {
            self.tableView.reloadData()
        }

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getEmployeData(completed: @escaping () -> ()) {
        let url = URL(string: "http://138.68.86.126/employer/")
        Alamofire.request(url!).responseJSON { response in
            let data = response.data
            do {
                self.employer = [try JSONDecoder().decode(Employer.self, from: data!)]
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
        return employer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployerViewController", for: indexPath)
        cell.textLabel?.text = employer[indexPath.row].full_name
        cell.detailTextLabel?.text = employer[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "employerDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EmployerDetailsVC {
            destination.employer = employer[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}
