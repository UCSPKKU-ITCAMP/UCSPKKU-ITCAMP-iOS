//
//  NetworkAgent.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/19/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON
import FirebaseDatabase


class NetworkAgent : NetworkAgentProtocol {
    
    
    
    private static var shareNetworkManager: NetworkAgent?
    
    var ref : DatabaseReference!
    
    private init(){
        ref = Database.database().reference()
    }
    
    public static func shared() -> NetworkAgent {
        if shareNetworkManager == nil{
            shareNetworkManager = NetworkAgent()
        }
        return shareNetworkManager!
    }
    
    func getSchedulesData() {
        
        var schedulesArray : [Schedules] = []
        schedulesArray.removeAll()
        
        var scheduleRef : DatabaseReference!
        scheduleRef = Database.database().reference()
        
        //Schedule Model
        scheduleRef = ref.child("2018").child("schedules")
        scheduleRef.observe(.value, with: { (schedulesData) in
            
            if let scheduleData = schedulesData.children.allObjects as? [DataSnapshot] {
        
                schedulesArray.removeAll()
                for schedules in scheduleData{
                    
                    if let schedule = schedules.value as? [String : AnyObject] {
                        let scheduleModel = Schedules()
                        scheduleModel.startTime = schedule["from"] as! String
                        scheduleModel.endTime = schedule["to"] as! String
                        //Room Model
                        if let roomsNSArray = schedule["rooms"] as? NSArray{
                            for i in roomsNSArray{
                                let roomModel = Rooms()
                                
                                var roomData = i as! [String: AnyObject]
                                roomModel.roomId = roomData["id"] as! String
                                var speakerData = roomData["speaker"] as! [String: AnyObject]
                                
                                roomModel.name = speakerData["name"] as! String
                                roomModel.position = speakerData["position"] as! String
                                roomModel.presentation_url = speakerData["presentation_url"] as! String
                                roomModel.profile_url = speakerData["profile_url"] as! String
                                roomModel.topic = speakerData["topic"] as! String
                                roomModel.video_url = speakerData["video_url"] as! String
                                roomModel.id = speakerData["id"] as! String
                                roomModel.company = speakerData["company"] as! String
                                scheduleModel.rooms.append(roomModel)

                            }
                        }
                        
                        
                        schedulesArray.append(scheduleModel)
                        
                        
                    }
                    
                }
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.SCHEDULE_DATA_SUCCESS), object: nil, userInfo: [Constants.NotificationKey.DATA : schedulesArray])
            }else{
                //No data come
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.SCHEDULE_DATA_FAILURE), object: nil)
            }
        })
        
        
        
    }
    
    func getSlidesData() {
        var slidesArray : [Slides] = []
        slidesArray.removeAll()
        
        var slidesRef : DatabaseReference!
        slidesRef = Database.database().reference()
        
        slidesRef = ref.child("2018").child("slides")
        slidesRef.observe(.value, with: { (slidesData) in
            if let slideData = slidesData.children.allObjects as? [DataSnapshot] {
                slidesArray.removeAll()
                for slides in slideData{
                    if let slide = slides.value as? [String : AnyObject] {
                        let slideModel = Slides()
                        slideModel.speaker_name = slide["speaker_name"] as! String
                        slideModel.speaker_profile_url = slide["speaker_profile_url"] as! String
                        slideModel.topic = slide["topic"] as! String
                        slideModel.url = slide["url"] as! String
                        
                        
                        
                        slidesArray.append(slideModel)
                    }
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.SLIDE_DATA_SUCCESS), object: nil, userInfo: [Constants.NotificationKey.DATA : slidesArray])
            }else{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.SLIDE_DATA_FAILURE), object: nil)
            }
            
        })
        
        
    }
    
    func getVideosData(){
        var videosArray : [Videos] = []
        videosArray.removeAll()
        
        var videosRef : DatabaseReference!
        videosRef = Database.database().reference()
        
        videosRef = ref.child("2018").child("videos")
        videosRef.observe(.value, with: { (videossData) in
            if let videoData = videossData.children.allObjects as? [DataSnapshot] {
                videosArray.removeAll()
                for videos in videoData{
                    if let video = videos.value as? [String : AnyObject] {
                        let videoModel = Videos()
                        videoModel.thumbnail = video["thumbnail"] as! String
                        videoModel.topic = video["topic"] as! String
                        videoModel.video_url = video["video_url"] as! String
                        
                        videosArray.append(videoModel)
                    }
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.VIDEOS_DATA_SUCCESS), object: nil, userInfo: [Constants.NotificationKey.DATA : videosArray])
            }else{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.VIDEOS_DATA_FAILURE), object: nil)
            }
            
        })
        
    }
    
    
}

