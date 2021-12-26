//
//  CircularButtonView.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct CircularButtonView: View {
	let iconName: String
	
    var body: some View {
        Image(systemName: iconName)
			.symbolVariant(.fill)
			.font(.headline)
			.foregroundColor(Color.theme.accentColor)
			.frame(width: 50, height: 50)
			.background(
				Circle()
					.fill(Color.theme.backgroundColor)
			)
			.shadow(
				color: Color.theme.accentColor.opacity(0.25),
				radius: 10, x: 0, y: 0
			)
			.padding()
    }
}

struct CircularButtonView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			CircularButtonView(iconName: "heart")
				.padding()
				.previewLayout(.sizeThatFits)
			
			CircularButtonView(iconName: "heart")
				.padding()
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}
    }
}
