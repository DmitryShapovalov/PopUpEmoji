//
//  EmojiTableViewCellModel.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiModel: NSObject {
     static var list = [0x1F601...0x1F601,
                        0x2702...0x27B0,
                        0x1F680...0x1F6C0,
                        0x1F600...0x1F636,
                        0x1F681...0x1F6C5,
                        0x1F30D...0x1F567]
}

extension EmojiModel {
    
    static func getAllEmojis() -> [String] {
        var emojiList = [String]()
        
        for interval in EmojiModel.list {
            for i in interval {
                let c = String(UnicodeScalar(i)!)
                emojiList.append(c)
            }
        }
        
        
        return emojiList
    }
}
