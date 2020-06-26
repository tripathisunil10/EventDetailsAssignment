//
//  EventTypeTableViewCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class EventTypeTableViewCell: UITableViewCell,IdentifiableCell {
    static var identifier: String{
        return "\(self)"
    }
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
