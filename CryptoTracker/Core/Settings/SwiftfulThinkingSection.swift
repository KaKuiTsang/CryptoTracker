//
//  SwiftfulThinkingSection.swift
//  CryptoTracker
//
//  Created by KaKui on 17/1/2022.
//

import SwiftUI

struct SwiftfulThinkingSection: View {
	let youtubeURL = URL(string: "https://www.youtube.com/c.swiftfulthinking")!
	let coffeeURL = URL(string: "https://www.buymecoffee.com/nicksarno")!
	
    var body: some View {
		Section {
			VStack(alignment: .leading) {
				Image("logo")
					.resizable()
					.frame(width: 100, height: 100)
					.clipShape(RoundedRectangle(cornerRadius: 20))
					.padding(.vertical)
				
				Text("This app is made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, Async/Await and CoreData")
					.font(.callout)
					.fontWeight(.medium)
					.lineLimit(nil)
			}
			
			Link("Subscribe on YouTube 🥳", destination: youtubeURL)
				.accentColor(.blue)
			
			Link("Support his coffee addiction ☕️", destination: coffeeURL)
				.accentColor(.blue)
		} header: {
			Text("Swiftful Thinking")
		}
    }
}

struct SwiftfulThinkingSection_Previews: PreviewProvider {
    static var previews: some View {
		List {
			SwiftfulThinkingSection()
		}
    }
}
