//
//  RedBlueTableController.swift
//  MRDataSourceDemo
//
//  Created by Max Rogers on 1/16/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

class RedBlueTableController: MRTableViewController {
    
    override func registerCells() {
        tableView.register(BlueTableCell.self, forCellReuseIdentifier: BlueModel.reuseIdentifier)
        tableView.register(RedTableCell.self, forCellReuseIdentifier: RedModel.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var viewModels: [MRViewModel] = []
        for _ in 0...2 {
            let red = RedModel()
            let blue = BlueModel()
            viewModels.append(red)
            viewModels.append(blue)
            viewModels.append(red)
            viewModels.append(red)
            viewModels.append(blue)
        }
        
        let sectionOne = MRDataSection(items: viewModels, sectionTitle: "Section One", sectionHeight: 60.0, sectionView: nil)
        let sectionTwo = MRDataSection(items: viewModels.reversed(), sectionTitle: "Section Two", sectionHeight: 80.0, sectionView: nil)
        self.sections = [sectionOne, sectionTwo]
    }
    
    
}
