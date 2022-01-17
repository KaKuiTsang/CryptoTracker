//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by KaKui on 17/1/2022.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.presentationMode) var presentationMode
	
    var body: some View {
		NavigationView {
			List {
				SwiftfulThinkingSection()
				CoinGeckoSection()
			}
			.listStyle(GroupedListStyle())
			.navigationTitle("Settings")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					CloseButton {
						presentationMode.wrappedValue.dismiss()
					}
				}
			}
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
