//
//  HIButtonsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIButtonsView: View {
	var body: some View {
		VStack(alignment:.leading) {
			Text("Push Buttons")
				.bold()
			
			HStack {
				Button("Cancel") {}
				Button("OK") {}
					 .keyboardShortcut(.defaultAction)

				Button(action: {}, label: {
					Text("Weather")
					Image(systemName: "cloud.sun.rain")
				})
			}
			
		}
		
		.padding()
	}
}
