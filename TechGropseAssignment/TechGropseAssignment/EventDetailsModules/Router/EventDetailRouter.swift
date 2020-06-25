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
        
        return EventDetailsViewController()
    }
    
    func popToRootViewController(nav: UINavigationController?) {
        
    }
    
    
}
