//
//  Guia.swift
//  FoodTracker
//
//  Created by DAM+DM on 11/02/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

class Guia: NSObject {
    
    //MARK: Properties
    var id: Int
    var name: String
    var mobileNumber: String
    var schedule: String
    
    
    init?(json: [String: Any]) {
        id = json["id"] as! Int
        name = json["name"] as! String
        mobileNumber = json["mobileNumber"] as! String
        schedule = json["schedule"] as! String
    }
}
