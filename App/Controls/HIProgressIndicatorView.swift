//
//  HIProgressIndicatorView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIProgressView: UIViewRepresentable {
	let value: Float
	
	func makeUIView(context: Context) -> UIProgressView {
		UIProgressView()
	}
	
	func updateUIView(_ view: UIProgressView, context: Context) {
		view.progress = value
	}
}

struct HIActivityIndicatorView: UIViewRepresentable {
	let active: Bool

	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let view = UIActivityIndicatorView()
		view.hidesWhenStopped = false
		return view
	}
	
	func updateUIView(_ view: UIActivityIndicatorView, context: Context) {
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

			HIProgressView(value: 0.5)
			HIActivityIndicatorView(active: false)
			HIActivityIndicatorView(active: true)
		}
		.padding()
	}
}
