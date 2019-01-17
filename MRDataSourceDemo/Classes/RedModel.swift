//
//  RedModel.swift
//  MRDataSourceDemo
//
//  Created by Max Rogers on 1/16/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

struct RedModel: MRViewModel {
    
    static var reuseIdentifier: String = String(describing: type(of: RedModel.self))
    var backgroundColor = UIColor.red.withAlphaComponent(0.4)

    func size() -> (rowHeight: CGFloat?, itemSize: CGSize?) {
        return (65, nil)
    }
    
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RedModel.reuseIdentifier) as! RedTableCell
        cell.configure(withModel: self)
        return cell
    }
    
}
