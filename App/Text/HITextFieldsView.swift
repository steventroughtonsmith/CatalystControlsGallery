//
//  HITextFieldsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIBorderedTextFieldView: View, UIViewRepresentable {
	typealias UIViewType = UITextField
	let view = UITextField()
	
	var placeholder = ""
	var borderStyle = UITextField.BorderStyle.none
	
	func makeUIView(context: Context) -> UIViewType {
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		view.placeholder = placeholder
		view.borderStyle = borderStyle
	}
}

struct HISearchFieldView: View, UIViewRepresentable {
	typealias UIViewType = UISearchTextField
	let view = UISearchTextField()
	
	var placeholder = ""
	var borderStyle = UITextField.BorderStyle.roundedRect
	
	func makeUIView(context: Context) -> UIViewType {
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		view.placeholder = placeholder
		view.borderStyle = borderStyle
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
