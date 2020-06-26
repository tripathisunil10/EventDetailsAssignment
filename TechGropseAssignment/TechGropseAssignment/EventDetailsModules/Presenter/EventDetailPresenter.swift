//
//  EventDetailPresenter.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
class EventDetailPresenter: EventDetailsPresenterProtocols {
    
    var tblDelegate: TableDelegateAndDataSource?
    var eventDetailView: EventDetailsViewProtocol?
    var interactor: EventDetailsInteractorProtocol?
    var router: EventDetailsRouterProtocol?
    var objEventMaster:EventDetailsMaster?
    func createRequestToConnectServerEventDetailsApi(with paramDict: [String : Any]) {
        interactor?.createRequestToEventDetailsListApi(with: paramDict)
    }
    
    
}

extension EventDetailPresenter:TableDelegateAndDataSource{
   
    func delegateNumberOfRowsInSectiontableView<T>(_ tableView: UITableView, numberOfRowsInSection section: Int, Presenter: T) -> Int {
         return 7
    }
    
    func cellForitem<T>(tableView: UITableView, indexPath: IndexPath, Presenter: T) -> UITableViewCell {
        
        guard let prsnter = Presenter as? EventDetailPresenter else{
         return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
          return eventInformationCellDequeueReusable(tblView: tableView, indexPATH: indexPath, presenter: prsnter)
            case 1:
            return eventLocationTableCellDequeueReusable(tblView: tableView, indexPATH: indexPath, presenter: prsnter)
            case 2:
            return eventBriefDescriptionTableCellDequeueReusable(tblView: tableView, indexPATH: indexPath, presenter: prsnter)
            case 3:
            return eventOrganizerTableCellDequeueReusable(tblView: tableView, indexPATH: indexPath, presenter: prsnter)
            case 4,5,6:
            return eventTypeTableCellDequeueReusable(tblView: tableView, indexPATH: indexPath, presenter: prsnter)
        default:
            return UITableViewCell()
        }
        
         
    }
    
    func didSelectCell<T>(tableView: UITableView, indexPath: IndexPath, Presenter: T) {
        
    }
    
    func registerTableViewCellInToNib(tableView: UITableView) {
        
        tableView.register(cell: EventInformationCell.self)
        tableView.register(cell: EventLocationTableViewCell.self)
        tableView.register(cell: EventBriefDescriptionTableViewCell.self)
        tableView.register(cell: EventOrganizerTableViewCell.self)
        tableView.register(cell: EventTypeTableViewCell.self)
    }
    
    private func eventInformationCellDequeueReusable(tblView:UITableView,indexPATH:IndexPath,presenter:EventDetailPresenter)->UITableViewCell{
        
        guard let cell = tblView.dequeueReusableCell(with: EventInformationCell.self) else {
            return UITableViewCell()
        }
    
        if let datalist =  presenter.objEventMaster?.data{
            cell.objeEvent = datalist
        }
        return cell
    
    }
    
    private func eventLocationTableCellDequeueReusable(tblView:UITableView,indexPATH:IndexPath,presenter:EventDetailPresenter)->UITableViewCell{
        
        guard let cell = tblView.dequeueReusableCell(with: EventLocationTableViewCell.self) else {
            return UITableViewCell()
        }
        if let datalist =  presenter.objEventMaster?.data{
            cell.objeEvent = datalist
    }
    
        return cell
    
    }
    
    private func eventBriefDescriptionTableCellDequeueReusable(tblView:UITableView,indexPATH:IndexPath,presenter:EventDetailPresenter)->UITableViewCell{
        
        guard let cell = tblView.dequeueReusableCell(with: EventBriefDescriptionTableViewCell.self) else {
            return UITableViewCell()
        }
    
        if let datalist =  presenter.objEventMaster?.data{
                   cell.objeEvent = datalist
           }
        return cell
    
    }
    
    private func eventOrganizerTableCellDequeueReusable(tblView:UITableView,indexPATH:IndexPath,presenter:EventDetailPresenter)->UITableViewCell{
        
        guard let cell = tblView.dequeueReusableCell(with: EventOrganizerTableViewCell.self) else {
            return UITableViewCell()
        }
    
        if let organizer = presenter.objEventMaster{
            cell.eventMasterObj = organizer
            cell.organizercollVW.reloadData()
        }
        return cell
    
    }
    private func eventTypeTableCellDequeueReusable(tblView:UITableView,indexPATH:IndexPath,presenter:EventDetailPresenter)->UITableViewCell{
        
        guard let cell = tblView.dequeueReusableCell(with: EventTypeTableViewCell.self) else {
            return UITableViewCell()
        }
        switch indexPATH.row {
        case 4:
            cell.titleLabel.text = "View event sponsers"
        case 5:
               cell.titleLabel.text = "View event performers"
        case 6:
             cell.titleLabel.text = "View setting plans"
        default:
            break
        }
    
        return cell
    
    }
    
    
    func delegateTableViewEstimatedHeight(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func DelegateTableViewHeightForRowAtIndexPath(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension EventDetailPresenter:EventDetailsInteractorPresenterProtocol{
    
    func eventDetailAPISuccessResponse(eventMaster:EventDetailsMaster?) {
        objEventMaster = eventMaster
        eventDetailView?.showEventDetailsAPiSuccess(eventMaster:eventMaster )
    }
    
    func eventDetailAPIFailedResponse(errorMessage: String) {
        eventDetailView?.showEventDetailsApiError(error:errorMessage)
    }
    
    
}
