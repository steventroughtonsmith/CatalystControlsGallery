//
//  HISwitchesView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HISwitchView: View, UIViewRepresentable {
	typealias UIViewType = UISwitch
	let view = UISwitch()
	var value = false
	
	func makeUIView(context: Context) -> UIViewType {
		view.preferredStyle = .sliding
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		view.isOn = value
	}
}

struct HISwitchesView: View {
	
	@State var a = true
	@State var b = false

	var body: some View {
		VStack(alignment:.leading) {
			Text("Switches")
				.bold()
			
			VStack(alignment:.leading) {
				HStack {
					Text("One")
					HISwitchView(value: a)
				}
				HStack {
					Text("Two")
					HISwitchView(value: b)
				}
			}
			
		}
		.padding()
	}
}
