//
//  BlueModel.swift
//  MRDataSourceDemo
//
//  Created by Max Rogers on 1/16/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

struct BlueModel: MRViewModel {
    
    static var reuseIdentifier: String = String(describing: type(of: BlueModel.self))
    
    var backgroundColor = UIColor.blue.withAlphaComponent(0.5)
    var id = "1"
    
    func size() -> (rowHeight: CGFloat?, itemSize: CGSize?) {
        return (85, nil)
    }
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlueModel.reuseIdentifier) as! BlueTableCell
        cell.configure(withModel: self)
        return cell
    }
    
    var selectable: Bool { return true }
    func selectCell(_ view: UIView?, viewController: UIViewController, indexPath: IndexPath) {
        guard let cell = view as? BlueTableCell else { return }
        cell.contentView.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        print("Tapped blue cell with id \(self.id)")
    }

}
