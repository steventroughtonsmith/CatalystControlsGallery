//
//  HIButtonsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIDefaultButton: UIViewRepresentable {
	let title: String
	let action: () -> Void

	private static let actionID = UIAction.Identifier(UUID().uuidString)

	func makeUIView(context: Context) -> UIButton {
		let view = UIButton(type:.system)
		view.role = .primary
		return view
	}
	
	func updateUIView(_ view: UIViewType, context: Context) {
		view.setTitle(title, for: .normal)
		view.removeAction(identifiedBy: Self.actionID, for: .primaryActionTriggered)
		view.addAction(UIAction(identifier: Self.actionID) { _ in action() }, for: .primaryActionTriggered)
		view.setContentHuggingPriority(.required, for: .horizontal) // << here !!
		view.setContentHuggingPriority(.required, for: .vertical)
	}
}


struct HIButtonsView: View {
	var body: some View {
		VStack(alignment:.leading) {
			Text("Push Buttons")
				.bold()
			
			HStack {
				Button("Cancel") {
					
				}
				
				HIDefaultButton(title:"OK", action:{})
				
				Button(action: {}, label: {
					Text("Weather")
					Image(systemName: "cloud.sun.rain")
				})
				.buttonStyle(DefaultButtonStyle())
			}
			
		}
		
		.padding()
	}
}
