//
//  EventOrganizerCollectionViewCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class EventOrganizerCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.layer.borderWidth = 0.5
            contentVW.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameOrg: UILabel!
    @IBOutlet weak var imgOrg: UIImageView!{
        didSet{
            imgOrg.layer.cornerRadius = imgOrg.frame.size.width/2
            imgOrg.clipsToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
