//
//  TechGropseConfig.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

let BASE_URL = "􏰉􏰊􏰊􏰋􏰇􏰌􏰌􏰂􏰁􏰍􏰎􏰏􏰐􏰁􏰆􏰃􏰑􏰎􏰁􏰅􏰒􏰐􏰓􏰔􏰌􏰁􏰋􏰏􏰌􏰍􏰂􏰃􏰅􏰌􏰉􏰊􏰊􏰋􏰇􏰌􏰌􏰂􏰁􏰍􏰎􏰏􏰐􏰁􏰆􏰃􏰑􏰎􏰁􏰅􏰒􏰐􏰓􏰔􏰌􏰁􏰋􏰏􏰌􏰍􏰂􏰃􏰅􏰌􏰉􏰊􏰊􏰋􏰇􏰌􏰌􏰂􏰁􏰍􏰎􏰏􏰐􏰁􏰆􏰃􏰑􏰎􏰁􏰅􏰒􏰐􏰓􏰔􏰌􏰁􏰋􏰏􏰌􏰍􏰂􏰃􏰅􏰌􏰉􏰊􏰊􏰋􏰇􏰌􏰌􏰂􏰁􏰍􏰎􏰏􏰐􏰁􏰆􏰃􏰑􏰎􏰁􏰅􏰒􏰐􏰓􏰔􏰌􏰁􏰋􏰏􏰌􏰍􏰂􏰃􏰅􏰌􏰉􏰊􏰊􏰋􏰇􏰌􏰌􏰂􏰁􏰍􏰎􏰏􏰐􏰁􏰆􏰃􏰑􏰎􏰁􏰅􏰒􏰐􏰓􏰔􏰌􏰁􏰋􏰏􏰌􏰍􏰂􏰃􏰅􏰌￼http://saudicalendar.com/api/user"
func SHOW_ALERT_WITH(Message:String){
    let alertPopUp = UIAlertController(title: ConstantTexts.AppName.rawValue, message: Message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (okaction) in
        
    }
    alertPopUp.addAction(okAction)
    appObject.window?.rootViewController?.present(alertPopUp, animated: true, completion: nil)
}

var appObject:AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
}
func SHOW_ACTIVITY(){
    SVProgressHUD.setBackgroundColor(UIColor.clear)
    SVProgressHUD.show()
    SVProgressHUD.setDefaultMaskType(.clear)
}


func HIDE_ACTIVITY(){
   SVProgressHUD.dismiss()
}
enum ConstantTexts: String {
    case AppName                        =  "TechGropseAssignment"
    var localizedString:String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
