//
//  HISegmentedControlView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HISegmentedControlView: View {
	@State var a = 0
	@State var b = 0

	var body: some View {
		VStack(alignment:.leading) {
			Text("Segmented Controls")
				.bold()
			
			Picker(selection: $a, label:Group{}, content: {
				Text("One")
					.tag(0)
				Text("Two")
					.tag(1)
				Text("Three")
					.tag(2)
			})
			.pickerStyle(SegmentedPickerStyle())
			
			Picker(selection: $b, label:Group{}, content: {
				Image(systemName: "star")
					.tag(0)
				Image(systemName: "square")
					.tag(1)
				Image(systemName: "circle")
					.tag(2)
			})
			.pickerStyle(SegmentedPickerStyle())
		}
		.padding()
	}
}
