//
//  DescriptionView.swift
//  CryptoTracker
//
//  Created by KaKui on 15/1/2022.
//

import SwiftUI

struct DescriptionView: View {
	
	@State private var showAll = false
	
	let description: String
	
    var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			Text(description)
				.font(.callout)
				.foregroundColor(Color.theme.secondaryTextColor)
				.lineLimit(showAll ? nil :3)
			
			Button {
				withAnimation {
					showAll.toggle()
				}
			} label: {
				Text(showAll ? "Less" : "Read more...")
					.font(.caption)
					.bold()
					.accentColor(Color.blue)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: "hello world")
    }
}
