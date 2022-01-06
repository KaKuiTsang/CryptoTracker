//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by KaKui on 23/12/2021.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
	}
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			}
        }
    }
}
