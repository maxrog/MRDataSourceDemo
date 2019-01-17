//
//  RedTableCell.swift
//  MRDataSourceDemo
//
//  Created by Max Rogers on 1/16/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

class RedTableCell: UITableViewCell, MRConfigurableCell {

    typealias T = RedModel
    var model: RedModel?
    
    func configure(withModel model: RedModel) {
        self.model = model
        contentView.backgroundColor = model.backgroundColor
    }
}
