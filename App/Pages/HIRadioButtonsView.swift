//
//  HIRadioButtonsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIRadioButtonsView: View {
	
	@State var a = 0

	var body: some View {
		VStack(alignment:.leading) {
			Text("Radio Buttons")
				.bold()
			
			Picker(selection: $a, label:Group{}, content: {
				Text("Tinker")
					.tag(0)
				Text("Tailor")
					.tag(1)
				Text("Soldier")
					.tag(2)
				Text("Spy")
					.tag(3)

			})
			.pickerStyle(InlinePickerStyle())
		}
		.padding()
	}
}
