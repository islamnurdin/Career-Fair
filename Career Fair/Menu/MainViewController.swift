//
//  MainViewController.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/5/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    let menuArray: [String] = ["Расписания", "Карта", "Работодатели", "Конкурсы", "Организаторы", "Партнеры и Медиа-партнеры", "Спонсоры", "Опросы"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
