//
//  CoinGeckoSection.swift
//  CryptoTracker
//
//  Created by KaKui on 17/1/2022.
//

import SwiftUI

struct CoinGeckoSection: View {
	let coingeckoURL = URL(string: "https://www.coingecko.com")!
	
    var body: some View {
		Section {
			VStack(alignment: .leading) {
				Image("coingecko")
					.resizable()
					.scaledToFit()
					.frame(height: 100)
				
				Text("The cryptocurrency data that is used in this app from a free api from CoinGecko! Prices may be slightly delayed.")
					.font(.callout)
					.fontWeight(.medium)
			}
			.padding(.vertical)
			
			Link("Visit CoinGecko 🐍", destination: coingeckoURL)
				.accentColor(.blue)
			
		} header: {
			Text("coingecko")
		}
    }
}

struct CoinGeckoSection_Previews: PreviewProvider {
    static var previews: some View {
		List {
			CoinGeckoSection()
		}
    }
}
