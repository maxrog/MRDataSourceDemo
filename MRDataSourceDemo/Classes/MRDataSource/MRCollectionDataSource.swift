//
//  MRCollectionDataSource.swift
//  Hoodwink
//
//  Created by Max Rogers on 1/15/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

// MARK: CollectionView DataSource

class MRCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var sections: [MRDataSection]
    
    required init(sections: [MRDataSection]) {
        self.sections = sections
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        return model.cell(forCollectionView: collectionView, atIndexPath: indexPath)
    }
    
}

// MARK: CollectionView Superclass

class MRCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    var dataSource: MRCollectionViewDataSource!
    
    var sections: [MRDataSection] = [] {
        didSet {
            assert(collectionView != nil, "CollectionView Outlet Not Set")
            dataSource = MRCollectionViewDataSource(sections: sections)
            collectionView.dataSource = dataSource
            collectionView.delegate = self
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    /// Override this if needed
    func registerCells() {}
    
    // MARK: TODO any UICollectionViewDelegate default behavior (spacing etc)
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        return viewModel.selectable
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        if let cell = collectionView.cellForItem(at: indexPath) {
            viewModel.selectCell(cell, viewController: self, indexPath: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewModel = sections[indexPath.section].items[indexPath.row]
        return viewModel.size().itemSize ?? .zero
    }
    
}
