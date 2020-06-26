//
//  EventDetailRouter.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
class EventDetailRouter: EventDetailsRouterProtocol {
    
    static func createEventDetailsViewController() -> EventDetailsViewController {
        
        
        let eventDetailVC =   AppStoryboard.mainStoryboard .instantiateViewController(withIdentifier: "EventDetailsViewController") as! EventDetailsViewController
        
               let presenter   : EventDetailsPresenterProtocols & EventDetailsInteractorPresenterProtocol = EventDetailPresenter()
               let interactor  : EventDetailsInteractorProtocol = EventDetailsIntractor()
                 let router      : EventDetailsRouterProtocol = EventDetailRouter()
                 let tableDelgte  : TableDelegateAndDataSource = EventDetailPresenter()
                   presenter.eventDetailView = eventDetailVC
                 presenter.router = router
                 presenter.interactor = interactor
                 interactor.presenter = presenter
                 presenter.tblDelegate = tableDelgte
                 eventDetailVC.EventDetailPresenter = presenter
                 return eventDetailVC
    
    }
    
    func popToRootViewController(nav: UINavigationController?) {
        
    }
    
    
}
