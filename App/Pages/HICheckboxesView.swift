//
//  HICheckboxesView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HICheckboxesView: View {
	
	@State var a = true
	@State var b = false

	var body: some View {
		VStack(alignment:.leading) {
			Text("Checkboxes")
				.bold()
			
			VStack(alignment:.leading) {
				Toggle("Distortion", isOn: $a)
				Toggle("Chorus", isOn: $b)
			}
			
		}
		.padding()
	}
}
