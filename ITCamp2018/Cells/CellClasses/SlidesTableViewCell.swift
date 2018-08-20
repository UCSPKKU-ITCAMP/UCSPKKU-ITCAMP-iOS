//
//  SlidesTableViewCell.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/23/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class SlidesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var slideTitle: UILabel!
    
    @IBOutlet weak var speakerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
