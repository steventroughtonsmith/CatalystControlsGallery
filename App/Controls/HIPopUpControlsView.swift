//
//  HIPopUpControlsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HIPopUpControlsView: View {
	@State var a = 1
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Pop-Up Menus")
				.bold()

			HStack {
				Picker(selection: $a, label:Group{}, content: {
					Text("Tinker")
						.tag(0)
					Text("Tailor")
						.tag(1)
					Text("Soldier")
						.tag(2)
					Text("Spy")
						.tag(3)
				})

				Menu {
					Button("Import") { }
					Button("Export") { }

				} label: {
					Text("Advanced")
				}
			}
		}
		.padding()
	}
}
