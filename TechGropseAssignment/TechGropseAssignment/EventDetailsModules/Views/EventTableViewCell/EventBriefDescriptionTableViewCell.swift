//
//  EventBriefDescriptionTableViewCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class EventBriefDescriptionTableViewCell: UITableViewCell,IdentifiableCell {

    static var identifier: String{
        return "\(self)"
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.clipsToBounds = true
        }
    }
    var objeEvent:EventData?{
      didSet{
          if let des = objeEvent?.ev_description{
            descriptionLabel.text = des
              
          }
      }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
