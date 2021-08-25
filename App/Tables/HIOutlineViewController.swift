//
//  HIOutlineViewController.swift
//  Catalyst Controls Gallery
//
//  Created by Steven Troughton-Smith on 25/08/2021.
//

import UIKit
import SwiftUI

struct HIOutlineViewControllerView: UIViewControllerRepresentable {
	typealias UIViewControllerType = HIOutlineViewController
	let viewController = HIOutlineViewController()
	
	func makeUIViewController(context: Context) -> UIViewControllerType {
		return viewController
	}
	
	func updateUIViewController(_ uiView: UIViewControllerType, context: Context) {
	}
}

class HIOutlineViewController: UICollectionViewController {
	
	enum HIOutlineSection {
		case main
	}
	
	class HIOutlineItem: Hashable {
		let title: String
		let subitems: [HIOutlineItem]
		
		init(title: String,
			 subitems: [HIOutlineItem] = []) {
			self.title = title
			self.subitems = subitems
		}
		func hash(into hasher: inout Hasher) {
			hasher.combine(identifier)
		}
		static func == (lhs: HIOutlineItem, rhs: HIOutlineItem) -> Bool {
			return lhs.identifier == rhs.identifier
		}
		private let identifier = UUID()
	}
	
	var dataSource: UICollectionViewDiffableDataSource<HIOutlineSection, HIOutlineItem>! = nil
	
	init() {
		var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
		listConfiguration.showsSeparators = false
		
		let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
		
		super.init(collectionViewLayout: layout)
		
		collectionView.backgroundColor = .systemBackground
		
		configureDataSource()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: -
	
	func configureDataSource() {
		
		let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, HIOutlineItem> { cell, indexPath, menuItem in
			
			var contentConfiguration = cell.defaultContentConfiguration()
			contentConfiguration.text = menuItem.title
			contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .body)

			contentConfiguration.imageProperties.reservedLayoutSize = CGSize(width: UIFloat(22), height: 0)
			
			var disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .automatic)
			disclosureOptions.reservedLayoutWidth = .custom(UIFloat(8))
			
			if menuItem.subitems.isEmpty == true {
				contentConfiguration.image = UIImage(systemName: "doc")
				disclosureOptions.isHidden = true
			}
			else {
				contentConfiguration.image = UIImage(systemName: "folder")
				disclosureOptions.isHidden = false
			}
			
			cell.contentConfiguration = contentConfiguration
			cell.accessories = [.outlineDisclosure(options: disclosureOptions)]

			cell.backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
		}
		
		dataSource = UICollectionViewDiffableDataSource<HIOutlineSection, HIOutlineItem>(collectionView: collectionView) {
			(collectionView: UICollectionView, indexPath: IndexPath, item: HIOutlineItem) -> UICollectionViewCell? in
		
			return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
		}
		
		collectionView.dataSource = dataSource
		
		refresh()
	}

	// MARK: -
	
	private lazy var menuItems: [HIOutlineItem] = {
		return [
			HIOutlineItem(title: "Folder A", subitems: [HIOutlineItem(title: "Document"), HIOutlineItem(title: "Document")]),
			HIOutlineItem(title: "Folder B", subitems: [HIOutlineItem(title: "Document")]),
			HIOutlineItem(title: "Folder C", subitems: [HIOutlineItem(title: "Document"), HIOutlineItem(title: "Folder D", subitems: [HIOutlineItem(title: "Document")])])
		]
	}()
	
	func initialSnapshot() -> NSDiffableDataSourceSectionSnapshot<HIOutlineItem> {
		var snapshot = NSDiffableDataSourceSectionSnapshot<HIOutlineItem>()
				
		func addItems(_ menuItems: [HIOutlineItem], to parent: HIOutlineItem?) {
			snapshot.append(menuItems, to: parent)
			snapshot.expand(menuItems)
			for menuItem in menuItems where !menuItem.subitems.isEmpty {
				addItems(menuItem.subitems, to: menuItem)
			}
		}
		
		addItems(menuItems, to: nil)
		
		return snapshot
	}
	
	func refresh() {
		guard let dataSource = collectionView.dataSource as? UICollectionViewDiffableDataSource<HIOutlineSection, HIOutlineItem> else { return }
		
		let snapshot = self.initialSnapshot()
		dataSource.apply(snapshot, to: .main, animatingDifferences: false)
	}
	
}
