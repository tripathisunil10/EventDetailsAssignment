//
//  CommonProtocol.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

 protocol TableDelegateAndDataSource:class {
    func delegateNumberOfRowsInSectiontableView<T>(_ tableView: UITableView, numberOfRowsInSection section: Int,Presenter:T) -> Int
    func cellForitem<T>(tableView: UITableView, indexPath: IndexPath,Presenter:T) -> UITableViewCell
    func didSelectCell<T>(tableView: UITableView, indexPath: IndexPath,Presenter:T)
    func registerTableViewCellInToNib(tableView: UITableView)
    func delegateTableViewEstimatedHeight(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    func DelegateTableViewHeightForRowAtIndexPath(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
}

protocol CollectionViewDelegateAndDataSource :class {
    
    func registerCollViewCellInToNib(collView: UICollectionView)
    func dataSourceNumberOfItemsInSectioncollectionView<T>(_ collectionView: UICollectionView, numberOfItemsInSection section: Int,presenter:T) -> Int
    func dataSourceCellForItemAtcollectionView<T>(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath,presenter:T) -> UICollectionViewCell
    func delegateDidSelectItemAtCollectionView<T>(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath,presenter:T)
    //func reloadCollectionView(imageList:[ImagePicked], selectedIndex:[Int])
    
}
extension TableDelegateAndDataSource{
    func delegateTableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableView.automaticDimension
    }
    func DelegateTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
         return  300
    }
}
