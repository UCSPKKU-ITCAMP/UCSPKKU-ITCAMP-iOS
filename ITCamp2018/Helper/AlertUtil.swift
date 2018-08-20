//
//  AlertUtil.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/25/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import Foundation
import UIKit

class AlertUtil {
    func getNetworkAlert()->UIAlertController{
        let alertController = UIAlertController (title: "Cellular Data is Turned Off", message: "Turn on cellular data or use Wi-Fi to access data.", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            let settingsUrl = URL(string: UIApplicationOpenSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.openURL(url)
                
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        return alertController
        
    }
    
    
    
    
    
    func displayAlert(alertTitle title: String,alertMsg message: String)->UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        return alertController
    }
    
    
    
}
