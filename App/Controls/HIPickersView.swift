//
//  HIPickersView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit


struct HIDateTimePicker: UIViewRepresentable {
	typealias UIViewType = UIDatePicker
	let view = UIDatePicker()
	var mode = UIDatePicker.Mode.dateAndTime
	
	func makeUIView(context: Context) -> UIViewType {
		view.locale = NSLocale(localeIdentifier: "en_GB") as Locale
		view.timeZone = TimeZone(identifier: "UTC")
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		view.datePickerMode = mode
	}
}

struct HIPickersView: View {
	@State var a = Date()
	
	var body: some View {
		VStack(alignment:.leading) {
			Text("Date & Time Pickers")
				.bold()
			
			HStack {
				Text("Starts:")
				HIDateTimePicker(mode:.date)
				HIDateTimePicker(mode:.time)
			}
		}
		.padding()
	}
}
