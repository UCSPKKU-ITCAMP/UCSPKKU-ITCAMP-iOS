//
//  VideosCollectionViewCell.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/25/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var activeView: UIView!
    
    @IBOutlet weak var videoImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
    @IBOutlet weak var thumbnilHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        self.cellWidth.constant = screenWidth
        self.thumbnilHeight.constant = (screenWidth - 40) / 2
        materializeActiveView(view: activeView)
        
    }

    func materializeActiveView(view : UIView){
        let cornerRadius: CGFloat = 2
        let shadowColor: UIColor? = UIColor.black
        let shadowOffsetWidth: Int = 0
        let shadowOffsetHeight: Int = 0
        let shadowOpacity: Float = 0.01
        
        view.layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        view.layer.masksToBounds = false
        view.layer.shadowColor = shadowColor?.cgColor
        view.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowPath = shadowPath.cgPath
        
        
        
    }
}
