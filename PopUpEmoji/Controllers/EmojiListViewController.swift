//
//  ViewController.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiListViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private var btAddNewCell: UIBarButtonItem!
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private properties
    
    fileprivate let viewModel = EmojiListViewModel()
    fileprivate enum AlertType {
        case addNew
        case updateCurrent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpTableView()
        bindToViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Private methods
    
    private func setUpTableView() {
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.register(EmojiTableViewCell.nib, forCellReuseIdentifier: EmojiTableViewCell.identifier)
    }
    
    private func bindToViewModel() {
        viewModel.reloadTableView = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.reloadTableRow = { [weak self] row in
            self?.tableView.beginUpdates()
            self?.tableView.reloadRows(at: [IndexPath(row: row, section: App.EmojiListViewController.TableViewHeaderCount)], with: .automatic)
            self?.tableView.endUpdates()
        }
        viewModel.showAlertFromButtonCell = { [weak self] index in
            self?.showAlert(type: .updateCurrent, index: index)
        }
    }
    
    @IBAction func addNewItemHendler(_ sender: UIBarButtonItem) {
        showAlert(type: .addNew)
    }
    
    fileprivate func showAlert(type: AlertType, index: Int? = nil) {
        let alert = UIAlertController(style: .alert)
        alert.addEmojiPicker(flow: .horizontal, paging: false) { [weak self] emojiCode in
            
            switch type {
            case .addNew:
                self?.viewModel.addItemDataSource(item: emojiCode!)
            case .updateCurrent:
                self?.viewModel.updateDataSource(item: emojiCode!, index: index!)
            }
            
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
}
