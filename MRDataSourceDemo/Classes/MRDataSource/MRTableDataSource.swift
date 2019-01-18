//
//  MRTableDataSource.swift
//  Hoodwink
//
//  Created by Max Rogers on 1/15/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

// MARK: TableView DataSource

class MRTableViewDataSource: NSObject, UITableViewDataSource {
    
    var sections: [MRDataSection]
    
    required init(sections: [MRDataSection]) {
        self.sections = sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        return model.cell(forTableView: tableView, atIndexPath: indexPath)
    }
    
}

// MARK: TableView Superclass

class MRTableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var dataSource: MRTableViewDataSource!
    
    var sections: [MRDataSection] = [] {
        didSet {
            assert(tableView != nil, "TableView Outlet Not Set")
            dataSource = MRTableViewDataSource(sections: sections)
            tableView.dataSource = dataSource
            tableView.delegate = self
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }

    /// Override this if needed
    func registerCells() {}

    // MARK: TODO any other UITableViewDelegate default behavior
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        return viewModel.selectable
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) {
            viewModel.selectCell(cell, navController: navigationController)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        return viewModel.size().rowHeight ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sections[section]
        return section.sectionHeight ?? 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        return section.sectionView
    }

    
}
