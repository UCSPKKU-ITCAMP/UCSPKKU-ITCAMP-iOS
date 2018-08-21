//
//  AboutUsViewController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 8/22/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "0096D4")
        self.title = "About"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func openFBPage(_ sender: UIButton) {
        if let url = URL(string: "https://ucspkku.itcamp.org/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
