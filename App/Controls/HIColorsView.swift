//
//  HIColorsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit

struct HIColorWell: UIViewRepresentable {
	let action: (_ color:UIColor?) -> Void

	private static let actionID = UIAction.Identifier(UUID().uuidString)

	func makeUIView(context: Context) -> UIColorWell {
		let view = UIColorWell()
		view.selectedColor = .red
		return view
	}

	func updateUIView(_ view: UIColorWell, context: Context) {
		view.removeAction(identifiedBy: Self.actionID, for: .valueChanged)
		view.addAction(UIAction(identifier: Self.actionID) { _ in
			self.action(view.selectedColor)
		}, for: .valueChanged)
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
