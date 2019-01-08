//
//  CustomCellTableViewCell.swift
//  PathOfExileLadder
//
//  Created by Ian Bailey on 1/3/19.
//  Copyright © 2019 Ian Bailey. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var characterName: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
