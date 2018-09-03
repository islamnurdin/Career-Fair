//
//  ViewController.swift
//  Career Fair
//
//  Created by MacBook Pro on 8/31/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawUI()
    }
    
    func drawUI() {
        
        let mainColor = UIColor(red:0.12, green:0.19, blue:0.35, alpha:1.0)
        
        let textFieldName = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 323, width: 345, height: 45))
        textFieldName.placeholder = "Имя"
        textFieldName.title = "Имя"
        textFieldName.titleColor = mainColor
        textFieldName.lineColor = mainColor
        textFieldName.lineHeight = 1.2
        self.view.addSubview(textFieldName)
        
        let textFieldSurname = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 374, width: 345, height: 45))
        textFieldSurname.placeholder = "Фамилия"
        textFieldSurname.title = "Фамилия"
        textFieldSurname.titleColor = mainColor
        textFieldSurname.lineColor = mainColor
        textFieldSurname.lineHeight = 1.2
        self.view.addSubview(textFieldSurname)
        
        let textFieldFamilyName = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 415, width: 345, height: 45))
        textFieldFamilyName.placeholder = "Отчество"
        textFieldFamilyName.title = "Отчество"
        textFieldFamilyName.titleColor = mainColor
        textFieldFamilyName.lineColor = mainColor
        textFieldFamilyName.lineHeight = 1.2
        self.view.addSubview(textFieldFamilyName)
        
        let textFieldNumber = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 466, width: 345, height: 45))
        textFieldNumber.placeholder = "Номер телефона (+996)"
        textFieldNumber.title = "Номер телефона"
        textFieldNumber.titleColor = mainColor
        textFieldNumber.lineColor = mainColor
        textFieldNumber.lineHeight = 1.2
        self.view.addSubview(textFieldNumber)
        
        let textFieldEmail = SkyFloatingLabelTextField(frame: CGRect(x: 33, y: 517, width: 345, height: 45))
        textFieldEmail.placeholder = "E-mail"
        textFieldEmail.title = "E-mail"
        textFieldEmail.titleColor = mainColor
        textFieldEmail.lineColor = mainColor
        textFieldEmail.lineHeight = 1.2
        self.view.addSubview(textFieldEmail)
    }
    
}

