//
//  SlidesViewController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/23/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit
import PKHUD

class SlidesViewController: UIViewController {

    
    @IBOutlet weak var slideTableView: UITableView!
    
    var slidesDatas = [Slides]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "0096D4")
        
        self.title = "Slides"
        slideTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CellsId.noSlideCellId)
        slideTableView.register(UINib(nibName: "SlidesTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.CellsId.pdfCellId)
        
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.SLIDE_DATA_SUCCESS), object:nil, queue:nil, using:slidesSuccess)
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.SLIDE_DATA_FAILURE), object:nil, queue:nil, using:slidesFailure)
        getSlidesData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func slidesSuccess(noti : Notification){
        if let data = noti.userInfo![Constants.NotificationKey.DATA] as? [Slides] {
            slidesDatas.removeAll()
            slidesDatas.append(contentsOf: data)
        }
        self.slideTableView.reloadData()
        HUD.hide()
        
        
    }
    
    func slidesFailure(noti : Notification){
        HUD.hide()
        self.present(AlertUtil().displayAlert(alertTitle: "Error while getting slides data", alertMsg: " "),animated: true, completion: nil)
    }
    
    func getSlidesData(){
        if(Reachability.isConnectedToNetwork()){
            HUD.show(.progress)
            NetworkAgent.shared().getSlidesData()
            
        }else{
            
            self.present(AlertUtil().getNetworkAlert(), animated: true,completion: nil)
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(slidesDatas.count > 0){
            
        
        UIApplication.shared.open(URL(string : slidesDatas[indexPath.row].url)!, options: [:], completionHandler: { (status) in
            
        })
            
        }
    }
}

extension SlidesViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(slidesDatas.count > 0){
            return slidesDatas.count
        }else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(slidesDatas.count > 0){
            let pdfCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellsId.pdfCellId) as! SlidesTableViewCell
            pdfCell.speakerName.text = slidesDatas[indexPath.row].speaker_name
            pdfCell.slideTitle.text = slidesDatas[indexPath.row].topic
            
            return pdfCell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellsId.noSlideCellId, for: indexPath as IndexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textAlignment = .center
            cell.textLabel!.text = "Presentation slides will be available after event"
            return cell
        }
        
    }
    
    
    
    
}
