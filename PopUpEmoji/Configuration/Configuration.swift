//
//  Configuration.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit
import Foundation


struct App {

    struct EmojiListViewController {
        static let TableViewHeaderCount: Int = 0
    }
    
    struct EmojiPopUpViewController {
        static let ItemSize: CGSize = CGSize(width: 40, height: 40)
        static let PreferredSize: CGSize = UIScreen.main.bounds.size
    }
}
