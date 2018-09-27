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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Главное меню"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView(gestureRecognizer:)))
        aboutView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deleteBackButtonTitle()
    }
    
    @objc func tappedView(gestureRecognizer: UIGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ContestFormsViewController") as! ContestFormsViewController
        vc.urlString = "https://docs.google.com/forms/d/1NIdI2kh4zNOWQ3ZFHysFEji85tyC2Ml3S07lgTEPIoM/edit#responses"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainMenu.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellID, for: indexPath) as! MainTableViewCell
        cell.fillMain(index: indexPath.row)
        cell.label.text = MainMenu.menu[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = MainMenu.menu[indexPath.row]
            presentViewController(vc: vc.identifier, sb: vc.storyboard)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
