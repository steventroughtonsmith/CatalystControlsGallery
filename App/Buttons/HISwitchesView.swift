//
//  HISwitchesView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HISwitchView: UIViewRepresentable {
	var isOn: Binding<Bool>

	func makeUIView(context: Context) -> UISwitch {
		let view = UISwitch()
		view.preferredStyle = .sliding
		view.addAction(UIAction { [weak view] _ in
			guard let view = view else { return }
			isOn.wrappedValue = view.isOn
			view.setOn(isOn.wrappedValue, animated: true)
		}, for: .primaryActionTriggered)
		return view
	}

	func updateUIView(_ view: UISwitch, context: Context) {
		view.setOn(isOn.wrappedValue, animated: true)
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
					HISwitchView(isOn: $a)
				}
				HStack {
					Text("Two")
					HISwitchView(isOn: $b)
				}
				HStack {
					Text("Always On")
					HISwitchView(isOn: .constant(true))
				}
			}
			
		}
		.padding()
	}
}
