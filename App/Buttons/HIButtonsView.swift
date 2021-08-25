//
//  HIButtonsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIDefaultButton: UIViewRepresentable {
	typealias UIViewType = UIButton
	let view = UIButton(type:.system)
	var title = ""
	var action = {}
	
	func makeUIView(context: Context) -> UIViewType {
		view.role = .primary
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		view.setTitle(title, for: .normal)
		view.addAction(UIAction(handler: { _ in
			self.action()
		}), for: .touchUpInside)
		
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
