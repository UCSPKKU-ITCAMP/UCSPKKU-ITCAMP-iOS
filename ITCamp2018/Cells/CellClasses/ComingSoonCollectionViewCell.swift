//
//  ComingSoonCollectionViewCell.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/24/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class ComingSoonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var comingSoonLbl: UILabel!
    
    
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        cellWidth.constant = screenWidth
        // Initialization code
    }

}
