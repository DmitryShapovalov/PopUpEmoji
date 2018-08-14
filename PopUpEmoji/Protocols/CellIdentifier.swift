//
//  Identifier.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit
import Foundation

protocol CellIdentifier {
    static var nib: UINib { get }
    static var identifier: String { get }
}

extension CellIdentifier {
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
