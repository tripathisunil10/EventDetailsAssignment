//
//  EventInformationCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class EventInformationCell: UITableViewCell,IdentifiableCell {
    
    
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.clipsToBounds = true
        }
    }
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var dOBLabel: UILabel!
    @IBOutlet weak var uniSexLabel: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var calenderLabel: UILabel!
    static var identifier: String{
        return "\(self)"
    }
    
    var objeEvent:EventData?{
        didSet{
            if let sDate = objeEvent?.ev_start_date{
                
                let startTime  = TechgropseHelper.sharedInstance.convertPostedDate(CurrentDate: sDate)
                if let eTime = objeEvent?.ev_end_date{
                     let endTime  = TechgropseHelper.sharedInstance.convertPostedDate(CurrentDate: eTime)
                    calenderLabel.text = startTime + " - " + endTime
                }
                
            }
            if let sTime = objeEvent?.ev_start_time{
                
                let startTime  = TechgropseHelper.sharedInstance.changeTime(time: sTime)
                if let eTime = objeEvent?.ev_end_time{
                     let endTime  = TechgropseHelper.sharedInstance.changeTime(time: eTime)
                    clockLabel.text = startTime + " - " + endTime
                }
                
            }
            if let lang = objeEvent?.ev_language{
                debugPrint(lang)
                languageLabel.text = "Arebic"
            }
            if let age = objeEvent?.ev_age_id{
                 debugPrint(age)
                dOBLabel.text = "10 Year"
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
