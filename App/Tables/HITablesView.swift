//
//  HITablesView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 25/08/2021.
//

import SwiftUI

struct HITablesView: View {
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Tables & Sidebars")
				.bold()
			
			HStack {
				HIOutlineViewControllerView()
					.frame(width: UIFloat(260), height: UIFloat(300))

				HISidebarViewControllerView()
					.frame(width: UIFloat(260), height: UIFloat(300))
				
				Spacer(minLength: 0)
			}
			
		}
		.padding()
	}
}
