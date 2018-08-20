//
//  ScheduleCollectionViewCell.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/19/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
    @IBOutlet weak var speakerImage: UIImageView!
    
    @IBOutlet weak var speakerTitle: UILabel!
    
    @IBOutlet weak var speakerName: UILabel!
    
    @IBOutlet weak var placeAndRoom: UILabel!
    
    @IBOutlet weak var activeView: UIView!
    
//    @IBOutlet weak var positionAndCompany: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        self.cellWidth.constant = screenWidth
        circleSpeakerImage(img: speakerImage)
        materializeActiveView(view: activeView)
        
    }
    
    func circleSpeakerImage(img: UIImageView){
        img.frame.size.width = 60
        img.frame.size.height = 60
        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.image = UIImage(named: "placeholder")
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
