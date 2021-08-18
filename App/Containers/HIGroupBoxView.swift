//
//  HIGroupBoxView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIGroupBoxView: View {
	@State var a = false
	@State var b = 0
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Group Boxes")
				.bold()
			
			HStack(alignment:.top) {
				GroupBox(label: Text("Details"), content: {
					Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
						.padding()
				})

				GroupBox(label: Toggle("Slide", isOn: $a), content: {
					Picker(selection: $b, label:Group{}, content: {
						Text("Steel")
							.tag(0)
							.frame(minWidth: UIFloat(100), alignment: .leading)
						
						Text("Brass")
							.tag(1)
							.frame(minWidth: UIFloat(100), alignment: .leading)
						
						Text("Wood")
							.tag(2)
							.frame(minWidth: UIFloat(100), alignment: .leading)
					})
					.pickerStyle(InlinePickerStyle())
					.disabled((a == false))
					.padding()
				})
			}
		}
		.padding()
	}
}
