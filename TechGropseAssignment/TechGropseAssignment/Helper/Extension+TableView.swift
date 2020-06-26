//
//  EventDetailsViewController.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

protocol IdentifiableCell: class {
    
    static var identifier: String { get }
}

extension UIView {
    
    static var nib: UINib {
        
        return UINib(nibName: "\(self)", bundle: nil)
    }
}

extension UIView {
    
    static func instantiateFromNib() -> Self? {
        
        func instanceFromNib<T: UIView>() ->T? {
            
            return nib.instantiate() as? T
        }
        
        return instanceFromNib()
    }
}

extension UINib {
    
    func instantiate() -> Any? {
        
        return self.instantiate(withOwner: nil, options: nil).first
    }
}



extension UITableView {
    
    
    // For Xib uses
    func register<T>(cell: T.Type) where T: IdentifiableCell, T: UITableViewCell {
        
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: IdentifiableCell>(with cell: T.Type) -> T? {
        
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
    
    

// For StoryBoard uses

    
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self, forCellReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    func dequeue<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self),
                                           for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }

        return cell
    }

    func dequeueCell(reuseIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath
        )
    }
    
}
