//
//  MasterViewTableViewCell.swift
//  iOS-Numbers-Application
//
//  Created by Michał on 24/01/2019.
//  Copyright © 2019 Michał Gawryluk. All rights reserved.
//

import UIKit

class MasterViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
