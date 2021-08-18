//
//  ViewController.swift
//  Voxcaster
//
//  Created by Steven Troughton-Smith on 19/07/2020.
//

import UIKit
import SwiftUI

struct MacTabView: View, UIViewControllerRepresentable {
	typealias UIViewType = HITabViewController
	
	var vc = HITabViewController()
	
	init<A:View, B:View>(titles:[String], @ViewBuilder content: @escaping () -> TupleView <(A,B)>) {
		let first = UIHostingController(rootView: content().value.0)
		let second = UIHostingController(rootView: content().value.1)
		
		first.title = titles[0]
		second.title = titles[1]
		
		vc.viewControllers = [first, second]
	}
	
	init<A:View, B:View, C:View>(titles:[String], @ViewBuilder content: @escaping () -> TupleView <(A,B, C)>) {
		let first = UIHostingController(rootView: content().value.0)
		let second = UIHostingController(rootView: content().value.1)
		let third = UIHostingController(rootView: content().value.2)

		first.title = titles[0]
		second.title = titles[1]
		third.title = titles[2]

		vc.viewControllers = [first, second, third]
	}
	
	init<A:View, B:View, C:View, D:View>(titles:[String], @ViewBuilder content: @escaping () -> TupleView <(A,B,C,D)>) {
		let first = UIHostingController(rootView: content().value.0)
		let second = UIHostingController(rootView: content().value.1)
		let third = UIHostingController(rootView: content().value.2)
		let fourth = UIHostingController(rootView: content().value.3)

		first.title = titles[0]
		second.title = titles[1]
		third.title = titles[2]
		fourth.title = titles[3]

		vc.viewControllers = [first, second, third, fourth]
	}
	
	init<A:View>(@ViewBuilder content: @escaping () -> A) {
		vc.viewControllers = [UIHostingController(rootView: content())]
	}
	
	func makeUIViewController(context: Context) -> UIViewType {
		return vc
	}
	
	func updateUIViewController(_ uiView: UIViewType, context: Context) {
		uiView.view.setContentHuggingPriority(.defaultHigh, for: .vertical)
		uiView.view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
	}
}

class HITabViewController: UIViewController {
	var viewControllers:[UIViewController]? = [] {
		willSet {
			guard let viewControllers = viewControllers else { return }
			for vc in viewControllers {
				vc.view.removeFromSuperview()
			}
		}
		didSet {
			guard let viewControllers = viewControllers else { return }
			
			segmentedControl.removeAllSegments()
			
			for vc in viewControllers {
				segmentedControl.insertSegment(withTitle: vc.title, at: segmentedControl.numberOfSegments, animated: false)
				
				vc.view.isHidden = true
				vc.view.backgroundColor = .clear
				contentView.addSubview(vc.view)
			}
			
			view.setNeedsLayout()
		}
	}
	
	let segmentedControl = UISegmentedControl()
	let contentView = UIView()
	let segmentedControlMask = UIView()

	var selectedIndex = 0 {
		didSet {
			view.setNeedsLayout()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		contentView.layer.cornerRadius = UIFloat(7)
		contentView.layer.masksToBounds = true
		contentView.layer.borderWidth = 0.5
		contentView.backgroundColor = .opaqueSeparator.withAlphaComponent(0.25)
		
		segmentedControlMask.layer.cornerRadius = UIFloat(7)
		segmentedControlMask.layer.masksToBounds = true
		segmentedControlMask.backgroundColor = .systemGroupedBackground
		
		segmentedControl.addTarget(self, action: #selector(segmentDidChange(_:)), for: .valueChanged)
		segmentedControl.selectedSegmentIndex = 0
		
		view.addSubview(contentView)
		view.addSubview(segmentedControlMask)
		view.addSubview(segmentedControl)
	}
	
	@objc func segmentDidChange(_ sender:UISegmentedControl) {
		selectedIndex = sender.selectedSegmentIndex
		view.setNeedsLayout()
	}
	
	override func viewDidLayoutSubviews() {
		
		segmentedControl.sizeToFit()
		segmentedControl.frame.origin.x = view.bounds.midX-segmentedControl.frame.width/2
		segmentedControlMask.frame = segmentedControl.frame.insetBy(dx: UIFloat(3), dy: UIFloat(3))

		var contentRect = view.bounds.inset(by: view.safeAreaInsets)
		contentRect.origin.y += segmentedControl.frame.height / 2
		contentRect.size.height -= segmentedControl.frame.height / 2

		contentView.frame = contentRect

		guard let viewControllers = viewControllers else { return }
		
		var i = 0
		for vc in viewControllers {
			vc.view.frame = contentView.bounds
			
			if i == selectedIndex {
				vc.view.isHidden = false
			}
			else {
				vc.view.isHidden = true
			}
			
			i = i + 1
		}
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		contentView.layer.borderColor = UIColor.separator.cgColor
	}
}

