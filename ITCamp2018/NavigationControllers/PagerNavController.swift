//
//  PagerNavController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/18/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import Foundation
import UIKit

class PagerNavController: UINavigationController,UIViewControllerTransitioningDelegate {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .default
//    }
    
    override func viewDidLoad() {
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.hexStringToUIColor(hex: "0075BC")]
        //self.navigationBar.tintColor = UIColor(red: 0.482, green: 0.494, blue: 0.518, alpha: 1.0)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "SourceSansPro-Bold", size: 30)!]
        
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        super.viewDidLoad()
    }
    
}
