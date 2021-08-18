//
//  HIPickersView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit


struct HIPickersView: View {
	@State var a = Date()
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Date & Time Pickers")
				.bold()
			
			DatePicker("Starts:", selection: $a)
		}
		.padding()
	}
}
