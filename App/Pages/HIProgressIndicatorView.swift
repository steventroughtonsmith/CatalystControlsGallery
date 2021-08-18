//
//  HIProgressIndicatorView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIActivityIndicatorView: View, UIViewRepresentable {
	typealias UIViewType = UIActivityIndicatorView
	let view = UIActivityIndicatorView()
	var active = false
	
	func makeUIView(context: Context) -> UIViewType {
		view.hidesWhenStopped = false
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		if active == true {
			view.startAnimating()
		}
		else {
			view.stopAnimating()
		}
	}
}

struct HIProgressIndicatorView: View {
	@State var a = 0.0
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Progress Views")
				.bold()

			ProgressView(value: 0.5)
			ProgressView()
			HIActivityIndicatorView()
		}
		.padding()
	}
}
