//
//  ScheduleContainerViewController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/18/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class ScheduleContainerViewController: ButtonBarPagerTabStripViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonBarView.selectedBar.backgroundColor = .yellow
        buttonBarView.backgroundColor = UIColor.gray
        //UIColor(red: 7/255, green: 185/255, blue: 155/255, alpha: 1)
    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let child_1 = TableChildExampleViewController(style: .plain, itemInfo: "Table View")
        let child_1 = ScheduleCollectionViewController(itemInfo: "First", itemIndex: 0)
        let child_2 = ScheduleCollectionViewController(itemInfo: "First", itemIndex: 1)
        let childViewControllers = [child_1, child_2]
        
        return Array(childViewControllers)
        
        
    }
    
}
