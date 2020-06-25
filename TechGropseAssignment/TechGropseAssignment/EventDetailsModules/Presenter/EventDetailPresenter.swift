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
    
    func createRequestToConnectServerEventDetailsApi(with paramDict: [String : Any]) {
        
    }
    
    
}
