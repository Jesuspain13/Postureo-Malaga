//
//  RutaTableViewCell.swift
//  interfazPropio
//
//  Created by DAM+DM on 12/02/2019.
//  Copyright © 2019 DAM+DM. All rights reserved.
//

import UIKit

class RutaTableViewCell: UITableViewCell {
    

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var nombreGuiaLabel: UILabel!
    @IBOutlet weak var telefonoGuiaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
