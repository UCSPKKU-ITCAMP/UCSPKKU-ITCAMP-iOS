//
//  ViewController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/17/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit
import Firebase
import PKHUD
import SDWebImage
import NotificationBannerSwift


class ScheduleViewController: UIViewController {

    var timeIndex = 0
    
    var itemCount = 0
    
    var schedulesDatas = [Schedules]()
    
    var timeData = [String]()
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "0096D4")
        
        self.title = "Schedules"
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.SCHEDULE_DATA_SUCCESS), object:nil, queue:nil, using:scheduleSuccess)
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.SCHEDULE_DATA_FAILURE), object:nil, queue:nil, using:scheduleFailure)
        
        self.scheduleCollectionView.register(UINib(nibName:"ScheduleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CellsId.scheduleCellId)
        self.scheduleCollectionView.register(UINib(nibName:"SectionHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CellsId.sectionHeaderCellId)
        
        self.scheduleCollectionView.register(UINib(nibName:"ComingSoonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CellsId.comingSoonCellId)
        
        
        
        
        if let flowLayout = self.scheduleCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        getSchedulesData()
        
        
        
    }
    
    
    func scheduleSuccess(noti : Notification){
        
        if let data = noti.userInfo![Constants.NotificationKey.DATA] as? [Schedules] {
            schedulesDatas.removeAll()
            schedulesDatas.append(contentsOf: data)
        }
        self.timeData.removeAll()
        for i in schedulesDatas{
            self.timeData.append("\(i.startTime) - \(i.endTime)")
        }
        self.scheduleCollectionView.reloadData()
        HUD.hide()
    }
    
    func scheduleFailure(noti : Notification){
        
        HUD.hide()
        self.present(AlertUtil().displayAlert(alertTitle: "Error while getting slides data", alertMsg: " "),animated: true, completion: nil)
        
    }
    
    func getSchedulesData(){
        if(Reachability.isConnectedToNetwork()){
            HUD.show(.progress)
            NetworkAgent.shared().getSchedulesData()
        }else{
            
            self.present(AlertUtil().getNetworkAlert(), animated: true,completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func userChangeTime(timeIndex : Int){
        
        self.timeIndex = timeIndex
        self.itemCount = schedulesDatas[timeIndex].rooms.count
        self.scheduleCollectionView.reloadData()
    }
    
}


extension ScheduleViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return timeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case section:
            
            //plus one for section header cell
            if(schedulesDatas[section].rooms.count > 0){
                return schedulesDatas[section].rooms.count + 1
            }else{
                return 2
            }
            
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let headerCell = scheduleCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellsId.sectionHeaderCellId, for: indexPath) as! SectionHeaderCollectionViewCell
        let scheduleCell = scheduleCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellsId.scheduleCellId, for: indexPath) as! ScheduleCollectionViewCell
        
        if(indexPath.row == 0){
            headerCell.headerText.text = timeData[indexPath.section]
            return headerCell
        }else{
            
            if(schedulesDatas[indexPath.section].rooms.count > 0){
                scheduleCell.speakerTitle.text = schedulesDatas[indexPath.section].rooms[indexPath.row - 1].topic
                scheduleCell.speakerName.text = "\(schedulesDatas[indexPath.section].rooms[indexPath.row - 1].name)"
                scheduleCell.placeAndRoom.text = "Room - \(schedulesDatas[indexPath.section].rooms[indexPath.row - 1].roomId)"
                scheduleCell.speakerImage.sd_setImage(with: URL(string: schedulesDatas[indexPath.section].rooms[indexPath.row - 1].profile_url), placeholderImage: UIImage(named: "placeholder.png"))

                return scheduleCell
            }else{
                let comingSoonCell = scheduleCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellsId.comingSoonCellId, for: indexPath) as! ComingSoonCollectionViewCell
                return comingSoonCell
            }
            
        }
        
    }
    
}
