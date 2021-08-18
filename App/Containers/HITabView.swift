//
//  HITabView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct HITabView: View {


	var body: some View {
		VStack(alignment:.leading) {
			Text("Tab View (Custom)")
				.bold()
			
			MacTabView(titles:["A", "B", "C"]) {
				Text("Page One")
				Text("Page Two")
				Text("Page Three")

			}
			.frame(height:UIFloat(300))
	
			
		}
		.padding()
	}
}
