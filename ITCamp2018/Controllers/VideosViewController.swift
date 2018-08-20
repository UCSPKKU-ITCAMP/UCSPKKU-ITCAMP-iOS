//
//  VideosViewController.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/25/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import UIKit
import PKHUD
import SDWebImage

class VideosViewController: UIViewController {

    var videosDatas = [Videos]()
    
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.backgroundColor = UIColor.hexStringToUIColor(hex: "0096D4")
        
        self.title = "Videos"

        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.VIDEOS_DATA_SUCCESS), object:nil, queue:nil, using:videoSuccess)
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.VIDEOS_DATA_FAILURE), object:nil, queue:nil, using:videoFailure)
        
        
        self.videosCollectionView.register(UINib(nibName:"VideosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CellsId.videoCellId)
        
        self.videosCollectionView.register(UINib(nibName:"ComingSoonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.CellsId.comingSoonCellId)
        
        if let flowLayout = self.videosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        getVideosData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getVideosData(){
        if(Reachability.isConnectedToNetwork()){
            HUD.show(.progress)
            NetworkAgent.shared().getVideosData()
        }else{
            
            self.present(AlertUtil().getNetworkAlert(), animated: true,completion: nil)
        }
    }
    
    func videoSuccess(noti : Notification){
        if let data = noti.userInfo![Constants.NotificationKey.DATA] as? [Videos] {
            videosDatas.removeAll()
            videosDatas.append(contentsOf: data)
        }
        
        self.videosCollectionView.reloadData()
        HUD.hide()
    }
    
    func videoFailure(noti : Notification){
        HUD.hide()
        self.present(AlertUtil().displayAlert(alertTitle: "Error while getting videos data", alertMsg: " "),animated: true, completion: nil)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(videosDatas.count > 0){
            
        
        UIApplication.shared.open(URL(string : videosDatas[indexPath.row].video_url)!, options: [:], completionHandler: { (status) in
            
        })
        }
        
        
    }
    
}


extension VideosViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (videosDatas.count > 0){
            return videosDatas.count
        }else{
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(videosDatas.count > 0){
            let videosCell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellsId.videoCellId, for: indexPath) as! VideosCollectionViewCell
            videosCell.videoTitle.numberOfLines = 0
            videosCell.videoTitle.text = videosDatas[indexPath.row].topic
            videosCell.videoImage.sd_setImage(with: URL(string: videosDatas[indexPath.row].thumbnail), placeholderImage: UIImage(named: "placeholder.png"))
            return videosCell
        }else{
            let noVideoscell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellsId.comingSoonCellId, for: indexPath) as! ComingSoonCollectionViewCell
            noVideoscell.comingSoonLbl.numberOfLines = 0
            noVideoscell.comingSoonLbl.text = "Videos will be available after event."
            
            
            return noVideoscell
        }
        
        
    }
    
    
    
}
