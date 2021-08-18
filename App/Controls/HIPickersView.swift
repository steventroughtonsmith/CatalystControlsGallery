//
//  HIPickersView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit

struct HIDateTimePicker: UIViewRepresentable {
	let mode: UIDatePicker.Mode
	let date: Binding<Date>

	func makeUIView(context: Context) -> UIDatePicker {
		let view = UIDatePicker()
		view.locale = NSLocale(localeIdentifier: "en_GB") as Locale
		view.timeZone = TimeZone(identifier: "UTC")
		view.addAction(UIAction { [weak view] _ in
			guard let view = view else { return }
			date.wrappedValue = view.date
			view.setDate(date.wrappedValue, animated: true)
		}, for: .valueChanged)
		return view
	}

	func updateUIView(_ view: UIDatePicker, context: Context) {
		view.datePickerMode = mode
		view.setDate(date.wrappedValue, animated: true)
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
				HIDateTimePicker(mode:.date, date: $a)
				HIDateTimePicker(mode:.time, date: $a)
			}
		}
		.padding()
	}
}
