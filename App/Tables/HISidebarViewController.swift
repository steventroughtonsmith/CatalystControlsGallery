//
//  HISidebarViewController.swift
//  Catalyst Controls Gallery
//
//  Created by Steven Troughton-Smith on 25/08/2021.
//

import UIKit
import SwiftUI

struct HISidebarViewControllerView: UIViewControllerRepresentable {
	typealias UIViewControllerType = HISidebarViewController
	let viewController = HISidebarViewController()
	
	func makeUIViewController(context: Context) -> UIViewControllerType {
		return viewController
	}
	
	func updateUIViewController(_ uiView: UIViewControllerType, context: Context) {
	}
}

class HISidebarViewController: UICollectionViewController {
	
	enum HISidebarSection {
		case favorites
		case locations
	}
	
	class HISidebarItem: Hashable {
		let title: String
		let symbol: String
		
		init(title: String,
			 symbol: String) {
			self.title = title
			self.symbol = symbol
		}
		func hash(into hasher: inout Hasher) {
			hasher.combine(identifier)
		}
		static func == (lhs: HISidebarItem, rhs: HISidebarItem) -> Bool {
			return lhs.identifier == rhs.identifier
		}
		private let identifier = UUID()
	}
	
	// MARK: -
	
	var dataSource: UICollectionViewDiffableDataSource<HISidebarSection, HISidebarItem>! = nil
	
	init() {
		var listConfiguration = UICollectionLayoutListConfiguration(appearance: .sidebar)
		listConfiguration.showsSeparators = false
		listConfiguration.headerMode = .firstItemInSection
		
		let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
		
		super.init(collectionViewLayout: layout)
		
		collectionView.backgroundColor = .systemBackground
		collectionView.delegate = self
		
		configureDataSource()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: -
	
	
	func configureDataSource() {
		
		let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, HISidebarItem> { cell, indexPath, menuItem in
			
			var contentConfiguration = cell.defaultContentConfiguration()
			contentConfiguration.text = menuItem.title
			
			var disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
			
			if indexPath.item == 0 {
				disclosureOptions.isHidden = false
			}
			else {
				contentConfiguration.image = UIImage(systemName: menuItem.symbol)
				disclosureOptions.isHidden = true
				
				contentConfiguration.imageProperties.reservedLayoutSize = CGSize(width: UIFloat(22), height: 0)
				contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .body)
			}
			
			cell.backgroundConfiguration = UIBackgroundConfiguration.clear()

			cell.contentConfiguration = contentConfiguration
			cell.accessories = [.outlineDisclosure(options: disclosureOptions)]
			
		}
		
		dataSource = UICollectionViewDiffableDataSource<HISidebarSection, HISidebarItem>(collectionView: collectionView) {
			(collectionView: UICollectionView, indexPath: IndexPath, item: HISidebarItem) -> UICollectionViewCell? in
			
			return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
		}
		
		collectionView.dataSource = dataSource
		
		refresh()
	}
	
	// MARK: -
	
	private lazy var favoritesMenuItems: [HISidebarItem] = {
		return [
			HISidebarItem(title: "All Items", symbol: "square.grid.2x2"),
			HISidebarItem(title: "Recents", symbol: "clock"),
		]
	}()
	
	private lazy var locationsMenuItems: [HISidebarItem] = {
		return [
			HISidebarItem(title: "Disk A", symbol: "externaldrive"),
			HISidebarItem(title: "Disk B", symbol: "externaldrive")
		]
	}()
	
	func favoritesSectionSnapshot() -> NSDiffableDataSourceSectionSnapshot<HISidebarItem> {
		var snapshot = NSDiffableDataSourceSectionSnapshot<HISidebarItem>()
		
		let sectionItem = HISidebarItem(title: "Favorites", symbol: "")
		
		snapshot.append([sectionItem])
		snapshot.append(favoritesMenuItems, to: sectionItem)
		snapshot.expand([sectionItem])
		
		return snapshot
	}
	
	func locationsSectionSnapshot() -> NSDiffableDataSourceSectionSnapshot<HISidebarItem> {
		var snapshot = NSDiffableDataSourceSectionSnapshot<HISidebarItem>()
		
		let sectionItem = HISidebarItem(title: "Locations", symbol: "")
		
		snapshot.append([sectionItem])
		
		snapshot.append(locationsMenuItems, to: sectionItem)
		snapshot.expand([sectionItem])
		
		return snapshot
	}
	
	func refresh() {
		guard let dataSource = collectionView.dataSource as? UICollectionViewDiffableDataSource<HISidebarSection, HISidebarItem> else { return }
		
		let favoritesSectionSnapshot = self.favoritesSectionSnapshot()
		let locationsSectionSnapshot = self.locationsSectionSnapshot()
		dataSource.apply(favoritesSectionSnapshot, to: .favorites, animatingDifferences: false)
		dataSource.apply(locationsSectionSnapshot, to: .locations, animatingDifferences: false)
	}
	
}
