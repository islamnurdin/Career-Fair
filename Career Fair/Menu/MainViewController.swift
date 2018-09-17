//
//  MainViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/5/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var aboutView: UIView!
    
    let menuArray = ["Расписания", "Карта", "Работодатели", "Конкурсы", "Организаторы", "Партнеры и Медиа-партнеры", "Спонсоры", "Опросы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Главное меню"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView(gestureRecognizer:)))
        aboutView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tappedView(gestureRecognizer: UIGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:
            "AboutViewController") as! AboutViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("Gesture")
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as! MainTableViewCell
        cell.fillMain(index: indexPath.row)
        cell.label.text = menuArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentVC(id: indexPath.row)
        print("pressed at \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func presentVC(id: Int) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        switch id {
        case 0:
            let vc = sb.instantiateViewController(withIdentifier: "ScheduleViewController") as? ScheduleViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            break
        case 1:
            let vc = sb.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = sb.instantiateViewController(withIdentifier: "EmployersViewController") as! EmployersViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = sb.instantiateViewController(withIdentifier: "EmployersViewController") as! EmployersViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = sb.instantiateViewController(withIdentifier: "OrganizatorsViewController") as! OrganizatorsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = sb.instantiateViewController(withIdentifier: "EmployersViewController") as! EmployersViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = sb.instantiateViewController(withIdentifier: "EmployersViewController") as! EmployersViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = sb.instantiateViewController(withIdentifier: "EmployersViewController") as! EmployersViewController
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
