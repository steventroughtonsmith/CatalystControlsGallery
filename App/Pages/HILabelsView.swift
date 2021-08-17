//
//  HILabelsView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI


struct HILabelsView: View {
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Labels")
				.bold()
			
			Spacer(minLength: UIFloat(8))

			Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
				.fixedSize(horizontal: false, vertical: true)

			Spacer(minLength: UIFloat(20))
			Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
				.lineLimit(nil)
				.fixedSize(horizontal: false, vertical: true)
				.font(.footnote)
		}
		.padding()
	}
}
