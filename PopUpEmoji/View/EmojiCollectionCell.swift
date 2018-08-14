//
//  EmojiCollectionCell.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiCollectionCell: UICollectionViewCell {

    static let identifier = String(describing: EmojiCollectionCell.self)
    
    lazy var emojiText: UILabel = {
        $0.backgroundColor = .clear
        $0.maskToBounds = true
        $0.textAlignment = .center
        return $0
    } (UILabel())
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    fileprivate func setup() {
        backgroundColor = .clear
        contentView.addSubview(emojiText)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.bounds.size = size
        layout()
        return size
    }
    
    func layout() {
        emojiText.frame = contentView.frame
    }
}
