//
//  ViewController.swift
//  interfazPropio
//
//  Created by DAM+DM on 12/02/2019.
//  Copyright © 2019 DAM+DM. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //MARK: tableview

    @IBOutlet var rutaTableView: UITableView!
    
    
    
    var rutas = [Ruta]()
    var service: Service!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        service = Service()
        
        cargarRutas()
        
    }
    
    //func textFieldDidEndEditing (_ textField: UITextField ){
    
    //}
    
    
    func cargarRutas() {
        let servicio = Service()
        // guardamos la lista de rutas recuperada del json
        servicio.peticionWS() { rutas in
            DispatchQueue.main.async {
                self.rutas = rutas as! [Ruta]
                self.rutaTableView.reloadData()
            }
        }
    }
    
    //Para cargar la imagen
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL, completionHandler: @escaping (UIImage) -> () ) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() {
                completionHandler(UIImage(data: data)!)
                
            }
        }
    }

    
    
    //Fin cargar imagen
    
    override func numberOfSections (in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return rutas.count
    }
    override func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "RutaTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RutaTableViewCell else { fatalError("The dequed cell is not an instance of RutaTableViewCell")
            
        }
        let ruta = rutas[indexPath.row]
        let url = URL(string: ruta.imagen)
        cell.imagenView.backgroundColor = UIColor.white
        cell.imagenView.image = nil
        downloadImage(from: url!) { imagen in cell.imagenView.image = imagen}
        cell.Label.text = ruta.name
        cell.nombreGuiaLabel.text = ruta.guia.name
        cell.telefonoGuiaLabel.text = ruta.guia.mobileNumber
        return cell
    }
    

}

