//
//  PortfolioCoinListView.swift
//  CryptoTracker
//
//  Created by KaKui on 8/1/2022.
//

import SwiftUI

struct PortfolioCoinListView: View {
	let coins: [Coin]
	
    var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text("Coin")
				Spacer()
				Text("Holdings")
				Spacer()
				Text("Price")
			}
			.font(.caption)
			.foregroundColor(Color.theme.secondaryTextColor)
			.padding(.horizontal)
			
			List(coins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: true)
					.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
					.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
			
		}
    }
}

struct PortfolioCoinListView_Previews: PreviewProvider {
    static var previews: some View {
		PortfolioCoinListView(coins: dev.viewModel.portfolioCoins)
    }
}
