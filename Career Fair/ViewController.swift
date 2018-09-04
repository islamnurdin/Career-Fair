//
//  ViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let yellow = UIColor.yellow
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.frame.height = 60.0
        
        if indexPath.row % 2 == 0 {
            cell.contentView.applyStyleView()
            cell.contentView.addLeftBorderWithColor(color: yellow, width: 7.0)
        }
        
        else if indexPath.row % 2 == 1 {
            cell.contentView.applyStyleView()
            cell.contentView.addRightBorderWithColor(color: yellow, width: 7.0)
        }
        
        cell.applyStyleViewCell()
        return cell
    }
    
    
//
//    func drawUI() {
//
//        let mainColor = UIColor(red:0.12, green:0.19, blue:0.35, alpha:1.0)
//
//        let textFieldName = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 323, width: 345, height: 45))
//        textFieldName.placeholder = "Имя"
//        textFieldName.title = "Имя"
//        textFieldName.titleColor = mainColor
//        textFieldName.lineColor = mainColor
//        textFieldName.lineHeight = 1.2
//        self.view.addSubview(textFieldName)
//
//        let textFieldSurname = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 374, width: 345, height: 45))
//        textFieldSurname.placeholder = "Фамилия"
//        textFieldSurname.title = "Фамилия"
//        textFieldSurname.titleColor = mainColor
//        textFieldSurname.lineColor = mainColor
//        textFieldSurname.lineHeight = 1.2
//        self.view.addSubview(textFieldSurname)
//
//        let textFieldFamilyName = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 415, width: 345, height: 45))
//        textFieldFamilyName.placeholder = "Отчество"
//        textFieldFamilyName.title = "Отчество"
//        textFieldFamilyName.titleColor = mainColor
//        textFieldFamilyName.lineColor = mainColor
//        textFieldFamilyName.lineHeight = 1.2
//        self.view.addSubview(textFieldFamilyName)
//
//        let textFieldNumber = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 466, width: 345, height: 45))
//        textFieldNumber.placeholder = "Номер телефона (+996)"
//        textFieldNumber.title = "Номер телефона"
//        textFieldNumber.titleColor = mainColor
//        textFieldNumber.lineColor = mainColor
//        textFieldNumber.lineHeight = 1.2
//        self.view.addSubview(textFieldNumber)
//
//        let textFieldEmail = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 517, width: 345, height: 45))
//        textFieldEmail.placeholder = "E-mail"
//        textFieldEmail.title = "E-mail"
//        textFieldEmail.titleColor = mainColor
//        textFieldEmail.lineColor = mainColor
//        textFieldEmail.lineHeight = 1.2
//        self.view.addSubview(textFieldEmail)
//    }
    
}

