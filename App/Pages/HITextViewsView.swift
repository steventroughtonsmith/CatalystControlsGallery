//
//  HITextViewsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HITextViewsView: View {
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Text Views")
				.bold()
			
			TextEditor(text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."))
				.frame(minHeight:UIFloat(100))
		}
		.padding()
	}
}
