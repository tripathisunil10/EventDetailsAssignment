//
//  EventDetailsVC+DataSource.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension EventDetailsViewController:UICollectionViewDelegate{
    
}
extension EventDetailsViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return evenDetailsObj?.data?.ev_image?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventImgCollectionViewCell", for: indexPath) as? EventImgCollectionViewCell else {
            return UICollectionViewCell()
        }
        if evenDetailsObj?.data?.ev_image?.count ?? 0 > 0{
            
            if let imgStr = evenDetailsObj?.data?.ev_image?[indexPath.item].image{
                let url = URL(string: imgStr)
                cell.eventIMg.sd_setImage(with: url, placeholderImage: UIImage(named: ""), options: .continueInBackground, completed: nil)
                cell.eventIMg.contentMode = .scaleToFill
            }
           
        }
        return cell
        
    }
    
    
}
extension EventDetailsViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
         return CGSize(width: width, height: 200)
    }
}
