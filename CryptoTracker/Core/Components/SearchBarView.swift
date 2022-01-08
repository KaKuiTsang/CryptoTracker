//
//  SearchBarView.swift
//  CryptoTracker
//
//  Created by KaKui on 1/1/2022.
//

import SwiftUI

struct SearchBarView: View {
	@Binding var searchText: String
	@FocusState private var isFocused: Bool
	
    var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(
					searchText.isEmpty
						? Color.theme.secondaryTextColor
						: Color.theme.accentColor
				)
			
			TextField("Search by name or symbol...", text: $searchText)
				.foregroundColor(Color.theme.accentColor)
				.focused($isFocused)
				.onTapGesture {}
			
			Image(systemName: "xmark")
				.symbolVariant(.circle)
				.symbolVariant(.fill)
				.foregroundColor(Color.theme.accentColor)
				.opacity(searchText.isEmpty ? 0 : 1)
				.onTapGesture {
					searchText = ""
					isFocused = false
				}
		}
		.font(.headline)
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.theme.backgroundColor)
				.shadow(
					color: Color.theme.accentColor.opacity(0.15),
					radius: 10, x: 0, y: 0
				)
		)
		.padding()
		
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
		SearchBarView(searchText: .constant(""))
    }
}
