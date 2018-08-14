//
//  EmojiPopUpViewController.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

// MARK: Properties
public typealias Selection = (String?) -> Swift.Void

class EmojiPopUpViewController: UIViewController {
    
    // MARK: - Private properties
    
    fileprivate var viewModel = EmojiPopUpViewModel()

    fileprivate lazy var collectionView: UICollectionView = { [unowned self] in
        $0.register(EmojiCollectionCell.self, forCellWithReuseIdentifier: EmojiCollectionCell.identifier)
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = true
        $0.decelerationRate = UIScrollView.DecelerationRate.fast
        $0.bounces = true
        $0.backgroundColor = .clear
        $0.maskToBounds = false
        $0.clipsToBounds = false
        $0.allowsSelection = true
        return $0
        } (UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    fileprivate lazy var layout: UICollectionViewFlowLayout = {
        $0.minimumInteritemSpacing = 0
        $0.minimumLineSpacing = 0
        $0.sectionInset = .zero
        return $0
    } (UICollectionViewFlowLayout())
    
    // MARK: Initialize
    
    required init(flow: UICollectionView.ScrollDirection, paging: Bool, selection: @escaping Selection) {
        super.init(nibName: nil, bundle: nil)
        
        viewModel = EmojiPopUpViewModel.init(complition: selection)
        self.layout.scrollDirection = flow
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        collectionView.isPagingEnabled = paging
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = collectionView
    }
    
    deinit {
        print("has deinitialized")
    }
}
