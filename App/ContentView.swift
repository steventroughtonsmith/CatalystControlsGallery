//
//  ContentView.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		MacTabView(titles:["Buttons", "Controls", "Containers", "Text"]) {
			ScrollView {
				VStack (alignment:.leading) {
					HIButtonsView()
					HICheckboxesView()
					HIRadioButtonsView()
					HISwitchesView()
					Spacer()
						.frame(maxWidth:.infinity)
				}
				.padding()
			}
			
			ScrollView {
				VStack (alignment:.leading) {
					HIPopUpControlsView()
					HISlidersView()
					HIProgressIndicatorView()
					HISegmentedControlView()
					HIColorsView()
					HIPickersView()
				}
				.padding()
			}
			
			ScrollView {
				VStack (alignment:.leading) {
					HIGroupBoxView()
					HITabView()
				}
				.padding()
				
			}
			
			ScrollView {
				VStack (alignment:.leading) {
					HILabelsView()
					HITextFieldsView()
					HITextViewsView()
				}
				.padding()
				
			}
		}
		.padding()
	}
}
