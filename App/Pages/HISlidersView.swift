//
//  HISlidersView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HISlidersView: View {
	@State var a = 75.0
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Sliders")
				.bold()
			
			Slider(value: $a, in: 0 ... 100, minimumValueLabel: Image(systemName:"tortoise"), maximumValueLabel: Image(systemName:"hare"), label: {
				Text("Label")
			})
		}
		.padding()
	}
}
