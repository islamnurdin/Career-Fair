//
//  Employer.swift
//  Career Fair
//
//  Created by MacBook Pro on 9/9/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let id: Int
    let fullName, description, logoURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case description
        case logoURL = "logo_url"
    }
}
