//
//  Service.swift
//  FoodTracker
//
//  Created by DAM+DM on 11/02/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import Foundation
class Service: NSObject {
    
    override init() {
        super.init()
    }
    
    func peticionWS(completionHandler: @escaping (Any) -> Void) {
        let url = URL(string: "http://192.168.60.73:8080/AppRutas/api/rutas")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    return
            }
            do {
                if let mimeType = httpResponse.mimeType, mimeType == "application/json",
                    let data = data,
                    let string = String(data: data, encoding: .utf8) {
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        data, options: [])
                    completionHandler(self.obtenerListaRutas(json: jsonResponse))
                    /*if let dictionary = jsonResponse as? [String: Any] {
                     if let rutas = dictionary["listaRutas"] as? [NSDictionary] {
                     print(rutas[0]["name"]!)
                     //devuelve el array con los diccionarios dentro
                     }
                     }
                     //DispatchQueue.main.async {
                     //self.recorrerJson(datos: data)
                     //}*/
                    
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
            
        }
        task.resume()
    }
    
    
    func obtenerListaRutas(json: Any) -> [Ruta] {
        var rutas = [Ruta]()
        //peticionWS() { json in
        if let dictionary = json as? [String: Any] {
            if let rutasJSON = dictionary["listaRutas"] as? [[String: Any]] {
                for ruta in rutasJSON {
                    //creo una instancia de ruta por cada iteracion y lo añado a la lista
                    let rutaCreada = Ruta(json: ruta)!
                    rutas.append(rutaCreada)
                }
                //print(rutas[0]["name"]!)
                //devuelve el array con los diccionarios dentro
                
            }
        }
        //retorno la lista con las rutas en su interior
        return rutas
    }
}


