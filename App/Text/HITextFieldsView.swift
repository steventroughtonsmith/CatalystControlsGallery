//
//  HITextFieldsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIBorderedTextFieldView: UIViewRepresentable {
	let placeholder: String
	let borderStyle: UITextField.BorderStyle

	func makeUIView(context: Context) -> UITextField {
		UITextField()
	}
	
	func updateUIView(_ view: UITextField, context: Context) {
		view.placeholder = placeholder
		view.borderStyle = borderStyle
	}
}

struct HISearchFieldView: UIViewRepresentable {
	let placeholder: String

	func makeUIView(context: Context) -> UISearchTextField {
		return UISearchTextField()
	}
	
	func updateUIView(_ view: UISearchTextField, context: Context) {
		view.placeholder = placeholder
		view.borderStyle = .roundedRect
	}
}

struct HITextFieldsView: View {
	@State var a = ""
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Text Fields")
				.bold()
			
			HStack {
				HIBorderedTextFieldView(placeholder:"Type here…", borderStyle: .bezel)
				HIBorderedTextFieldView(placeholder:"Type here…", borderStyle: .roundedRect)
				HISearchFieldView(placeholder:"Search…")
			}
		}
		.padding()
	}
}
