//
//  EntityDetailsPresenterProtocols.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
protocol EventDetailsPresenterProtocols: class {
    
    var eventDetailView          :  EventDetailsViewProtocol? { get set }
    var interactor               :  EventDetailsInteractorProtocol? { get set }
    var router                   :  EventDetailsRouterProtocol? { get set}
    
    var tblDelegate:TableDelegateAndDataSource?{set get}
    func createRequestToConnectServerEventDetailsApi(with paramDict:[String:Any])
    
    //var arrFollowingList:[FollowersList]?{set get}
}

protocol EventDetailsPresenterToViewProtocol {
     var EventDetailPresenter: EventDetailsPresenterProtocols? { get set }
}

protocol EventDetailsViewProtocol: class {
    func showEventDetailsAPiSuccess()
    func showEventDetailsApiError(error:String)
}

protocol  EventDetailsInteractorProtocol: class {
    
    var presenter:EventDetailsInteractorPresenterProtocol? { get set }
    func createRequestToEventDetailsListApi(with paramDict:[String:Any])

}

protocol  EventDetailsRouterProtocol: class {
    static func createEventDetailsViewController()->EventDetailsViewController
    func popToRootViewController(nav:UINavigationController?)
}

protocol  EventDetailsInteractorPresenterProtocol: class {
    func eventDetailAPISuccessResponse()
    func eventDetailAPIFailedResponse(errorMessage:String)
}
