//
//  HIColorsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit

struct HIColorWell: UIViewRepresentable {
	typealias UIViewType = UIColorWell
	let view = UIColorWell()
	var action:(_ color:UIColor?) -> Void = { color in }
	
	func makeUIView(context: Context) -> UIViewType {
		view.selectedColor = .red
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
		view.addAction(UIAction(handler: { _ in
			self.action(view.selectedColor)
		}), for: .valueChanged)
	}
}


struct HIColorsView: View {
	@State var a = Color.red
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Color")
				.bold()
			
			HStack {
				HIColorWell(action: { color in
					guard let color = color else { return }
					
					a = Color(color)
				})
				.frame(width: UIFloat(40), height: UIFloat(40))
				
				Text("Colored label")
					.foregroundColor(a)
			}
		}
		.padding()
	}
}
