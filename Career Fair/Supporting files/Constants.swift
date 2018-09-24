//
//  Constants.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/10/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import UIKit

struct Colors {
    static let darkBlue = UIColor.init(hex: 0x1F3058)
    static let yellow   = UIColor.init(hex: 0xFEE04A)
    static let gray     = UIColor.init(hex: 0xF7F7F7)
    static let corall   = UIColor.init(hex: 0xF7AEAE)
}

struct MainMenu {
    
    struct ViewController {
        var title: String
        var storyboard: String
        var identifier: String
    }
    
    static let menu = [ViewController(title: "Расписание", storyboard: "Main", identifier: "ScheduleViewController"),
                       ViewController(title: "Карта", storyboard: "Main", identifier: "MapViewController"),
                       ViewController(title: "Работодатели", storyboard: "Main", identifier: "EmployersViewController"),
                       ViewController(title: "Конкурсы", storyboard: "Main", identifier: "ContestsViewController"),
                       ViewController(title: "Организаторы", storyboard: "Main", identifier: "OrganizatorsViewController"),
                       ViewController(title: "Партнеры и Медиа-партнеры", storyboard: "Main", identifier: "PartnersViewController"),
                       ViewController(title: "Спонсоры", storyboard: "Main", identifier: "SponsorsViewController"),
                       ViewController(title: "Опросы", storyboard: "Main", identifier: "SurveyViewController")]
}

struct MapMenu {
    
    struct Map {
        var title: String
        var image: String
    }
    
    static let mapList = [Map(title: "1", image: "floor1"),
                          Map(title: "2", image: "floor2"),
                          Map(title: "3", image: "floor3"),
                          Map(title: "4", image: "floor4"),
                          Map(title: "FZ", image: "fz")]

}
