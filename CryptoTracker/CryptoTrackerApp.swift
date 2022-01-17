//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by KaKui on 23/12/2021.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
	@State private var showLaunchView = true
	
	init() {
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accentColor)]
	}
	
    var body: some Scene {
        WindowGroup {
			ZStack {
				NavigationView {
					HomeView()
						.navigationBarHidden(true)
				}
				
				if showLaunchView {
					ZStack {
						LaunchView(showLaunchView: $showLaunchView)
					}
					.zIndex(2)
					.transition(.move(edge: .leading))
				}
			}
        }
    }
}
