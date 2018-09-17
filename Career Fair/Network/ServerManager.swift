//
//  ServerManager.swift
//  Career Fair
//
//  Created by ITLabAdmin on 9/17/18.
//  Copyright © 2018 Islam & Co. All rights reserved.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequestManager {
    
    class var shared: ServerManager {
        struct Static {
            static let instance = ServerManager()
        }
        return Static.instance
    }
}
