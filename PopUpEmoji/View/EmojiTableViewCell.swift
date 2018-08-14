//
//  EmojiTableViewCell.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell, CellIdentifier {

    @IBOutlet var btEmoji: UIButton!
    var cellButtonTouchUpInsice : (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        if let btnAction = self.cellButtonTouchUpInsice {
            btnAction()
        }
    }
}
