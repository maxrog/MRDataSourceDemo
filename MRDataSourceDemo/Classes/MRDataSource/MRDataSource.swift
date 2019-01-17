//
//  MRDataSource.swift
//  Hoodwink
//
//  Created by Max Rogers on 1/15/19.
//  Copyright © 2019 Max Rogers. All rights reserved.
//

import UIKit

// TODO: Any other useful things you can think of animations of loading, prefetch, network things, reordering?

// MARK: Shared

/// UITableViewCells or UICollectionViewCells conform to this protocol
protocol MRConfigurableCell {
    associatedtype T
    var model: T? { get set }
    func configure(withModel model: T)
}

/// ViewModel objects conform to this protocol
protocol MRViewModel {
    static var reuseIdentifier: String { get }
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
    func cell(forCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell
    func size() -> (rowHeight: CGFloat?, itemSize: CGSize?)
    func selectCell(_ view: UIView, navController: UINavigationController?)
}
/// Default Implementation
extension MRViewModel {
    func cell(forTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func cell(forCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

/// MRDataSourceSection conforms to this protocol below
protocol MRDataSourceSection {
    var items: [MRViewModel] { get set }
    var sectionTitle: String? { get set }
    var sectionHeight: CGFloat? { get set }
    var sectionView: UIView? { get set }
    
    init(items: [MRViewModel], sectionTitle: String?, sectionHeight: CGFloat?, sectionView: UIView?)
}

/// Section that gets created to set datasource model in VC
class MRDataSection: MRDataSourceSection {
    
    var items: [MRViewModel]
    var sectionTitle: String?
    var sectionHeight: CGFloat?
    var sectionView: UIView?
    
    required init(items: [MRViewModel], sectionTitle: String?, sectionHeight: CGFloat?, sectionView: UIView?) {
        self.items = items
        self.sectionTitle = sectionTitle
        self.sectionHeight = sectionHeight
        self.sectionView = sectionView
    }
    
}
