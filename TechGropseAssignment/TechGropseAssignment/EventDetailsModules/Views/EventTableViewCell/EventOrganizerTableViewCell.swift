//
//  EventOrganizerTableViewCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class EventOrganizerTableViewCell: UITableViewCell,IdentifiableCell {
    static var identifier: String{
        return "\(self)"
    }
    
    var eventMasterObj : EventDetailsMaster?
    
    @IBOutlet weak var organizercollVW: UICollectionView!{
        didSet{
            organizercollVW.delegate = self
            organizercollVW.dataSource = self
        }
    }
    
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        organizercollVW.register(UINib.init(nibName: "EventOrganizerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventOrganizerCollectionViewCell")
    }

    
}
extension EventOrganizerTableViewCell:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return eventMasterObj?.data?.event_organizer?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventOrganizerCollectionViewCell", for: indexPath) as? EventOrganizerCollectionViewCell else {
            return UICollectionViewCell()
        }
        if eventMasterObj?.data?.event_organizer?.count ?? 0 > 0{
            
            if let imgStr = eventMasterObj?.data?.event_organizer?[indexPath.item].o_logo{
                let url = URL(string: imgStr)
                cell.imgOrg.sd_setImage(with: url, placeholderImage: UIImage(named: ""), options: .continueInBackground, completed: nil)
                cell.imgOrg.contentMode = .scaleAspectFit
            }
            if let name = eventMasterObj?.data?.event_organizer?[indexPath.item].o_name{
                cell.nameOrg.text = name
            }
            
           
        }
      
        return cell
        
    }
    
    
}
extension EventOrganizerTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 120, height: 120)
    }
}
