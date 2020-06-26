//
//  TechgropseHelper.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
class TechgropseHelper: NSObject {

static var sharedInstance = TechgropseHelper()
private override init() {
    
    }
    func convertPostedDate(CurrentDate:String) -> String{
    
    let stringInDate = CurrentDate
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: stringInDate)
    dateFormatter.dateFormat = "dd MMM, yyyy"
    dateFormatter.locale = tempLocale
    let dateString = dateFormatter.string(from: date ?? Date())
    return dateString
        
    }
     func changeTime(time:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
       
        if let showTime = dateFormatter.date(from: time){
            let dateFormatter2 = DateFormatter()
             dateFormatter2.timeZone =  NSTimeZone(abbreviation: "GMT+0:00") as TimeZone?
            dateFormatter2.setLocalizedDateFormatFromTemplate("h:mm a")
            let set_time = dateFormatter2.string(from: showTime).uppercased()
            return set_time
        }
        else{
            return ""
        }
    }
    
}

