//
//  TableViewCell.swift
//  Verdad o Reto
//
//  Created by J053_Fabi0 on 11/01/18.
//  Copyright © 2018 Yoyomero. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
