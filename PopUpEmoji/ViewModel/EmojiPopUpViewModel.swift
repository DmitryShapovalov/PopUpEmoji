//
//  EmojiPopUpViewModel.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiPopUpViewModel: NSObject {

    fileprivate var selection: Selection!
    fileprivate var images: [String] = EmojiModel.getAllEmojis()
    
    var preferredSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    var itemSize: CGSize {
        return App.EmojiPopUpViewController.ItemSize
    }
    
    override init() {
        super.init()
    }
    
    init(complition: @escaping Selection) {
        super.init()
        self.selection = complition
    }
}

// MARK: - CollectionViewDelegate
extension EmojiPopUpViewModel: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selection(images[indexPath.item])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - CollectionViewDataSource
extension EmojiPopUpViewModel: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCollectionCell.identifier, for: indexPath) as? EmojiCollectionCell else { return UICollectionViewCell() }
        item.emojiText.text = images[indexPath.row]
        return item
    }
}

// MARK: - CollectionViewDelegateFlowLayout
extension EmojiPopUpViewModel: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
