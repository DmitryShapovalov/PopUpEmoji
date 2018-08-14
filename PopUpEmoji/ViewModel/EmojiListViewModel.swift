//
//  EmojiListViewModel.swift
//  PopUpEmoji
//
//  Created by Dmytro Shapovalov on 8/14/18.
//  Copyright © 2018 Dmytro Shapovalov. All rights reserved.
//

import UIKit

class EmojiListViewModel: NSObject {
    
    var items = [String]()
    var reloadTableView: (() -> Void)?
    var showAlertFromButtonCell: ((Int) -> Void)?
    var reloadTableRow: ((Int) -> Void)?
    
    func addItemDataSource(item: String) {
        items.append(item)
        reloadTableView!()
    }
    
    func updateDataSource(item: String, index: Int) {
        items[index] = item
        reloadTableRow!(index)
    }
}

// MARK: - UITableViewDataSource
extension EmojiListViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.identifier, for: indexPath) as! EmojiTableViewCell
        cell.btEmoji.setTitle(items[indexPath.row], for: .normal)
        cell.cellButtonTouchUpInsice = { [weak self] in
            self?.showAlertFromButtonCell!(indexPath.row)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension EmojiListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
