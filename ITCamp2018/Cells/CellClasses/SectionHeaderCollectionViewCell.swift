//
//  SectionHeaderCollectionViewCell.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/21/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class SectionHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var headerText: UILabel!
    
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        self.cellWidth.constant = screenWidth
        
    }

}
