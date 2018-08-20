//
//  CollectionReusableView.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/21/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {

    
    @IBOutlet weak var headerWidth: NSLayoutConstraint!
    
    @IBOutlet weak var headerText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        self.headerWidth.constant = screenWidth
    }
    
}
