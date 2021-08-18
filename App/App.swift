//
//  HI_ToolboxApp.swift
//  HI Toolbox
//
//  Created by Steven Troughton-Smith on 17/08/2021.
//

import SwiftUI
import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate {
	var window: UIWindow?
	
	func applicationDidFinishLaunching(_ application: UIApplication) {
		window = UIWindow()
		window?.rootViewController = UIHostingController(rootView: ContentView())

		#if targetEnvironment(macCatalyst)
		window?.rootViewController?.view.backgroundColor = .clear
		window?.windowScene?.titlebar?.toolbar = NSToolbar()
		#endif
		
		window?.makeKeyAndVisible()
	}
}
