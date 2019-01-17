//
//  BlueTableCell.swift
//  MRDataSourceDemo
//
//  Created by Max Rogers on 1/16/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

class BlueTableCell: UITableViewCell, MRConfigurableCell {
    
    typealias T = BlueModel
    var model: BlueModel?
    
    func configure(withModel model: BlueModel) {
        self.model = model
        contentView.backgroundColor = model.backgroundColor
    }
}
