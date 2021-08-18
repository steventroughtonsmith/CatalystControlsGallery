//
//  HIColorsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit

struct HIColorsView: View {
	@State var a = Color.red
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Color")
				.bold()
			
			HStack {
				ColorPicker(selection: $a) {}
				.frame(width: UIFloat(40), height: UIFloat(40))

				Text("Colored label")
					.foregroundColor(a)
			}
		}
		.padding()
	}
}
