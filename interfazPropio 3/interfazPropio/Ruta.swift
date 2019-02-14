//
//  Ruta.swift
//  FoodTracker
//
//  Created by DAM+DM on 11/02/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation

class Ruta: NSObject {
    
    //MARK: Properties
    var id: Int
    var name: String
    var places: String
    var length: String
    var imagen: String
    var guia: Guia
    
    init?(json: [String: Any]) {
        id = json["id"] as! Int
        name = json["name"] as! String
        places = json["places"] as! String
        length = json["length"] as! String
        imagen = json["urlImagen"] as! String
        guia = Guia(json: json["guia"] as! [String: Any])!
    }
}
