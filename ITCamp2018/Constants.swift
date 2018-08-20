//
//  Constants.swift
//  ITCamp2018
//
//  Created by Nyan Lin Tun on 7/18/18.
//  Copyright © 2018 Rinda. All rights reserved.
//

import Foundation

class Constants {
    enum CellsId {
        static let scheduleCellId = "scheduleCell"
        static let sectionHeaderCellId = "sectionHeaderCell"
        static let pdfCellId = "slideCell"
        static let noSlideCellId = "noSlideCell"
        static let comingSoonCellId = "comingSoonCell"
        static let videoCellId = "videoCell"
    }
    
    enum NotificationKey {
        static let DATA = "data"
        
        static let SCHEDULE_DATA_SUCCESS = "schedulesuccess"
        static let SCHEDULE_DATA_FAILURE = "schedulefailure"
        
        static let SLIDE_DATA_SUCCESS = "slidesuccess"
        static let SLIDE_DATA_FAILURE = "slidefailure"
        
        static let VIDEOS_DATA_SUCCESS = "videosuccess"
        static let VIDEOS_DATA_FAILURE = "vidoesfailure"
        
    }
}
