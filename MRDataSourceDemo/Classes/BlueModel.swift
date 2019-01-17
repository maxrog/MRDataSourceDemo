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
    
    func size() -> (rowHeight: CGFloat?, itemSize: CGSize?) {
        return (85, nil)
    }
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BlueModel.reuseIdentifier) as! BlueTableCell
        cell.configure(withModel: self)
        return cell
    }

}
