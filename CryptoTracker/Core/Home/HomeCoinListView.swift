//
//  HomeCoinListView.swift
//  CryptoTracker
//
//  Created by KaKui on 8/1/2022.
//

import SwiftUI

struct HomeCoinListView: View {
	let coins: [Coin]
	
    var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text("Coin")
				Spacer()
				Text("Price")
			}
			.font(.caption)
			.foregroundColor(Color.theme.secondaryTextColor)
			.padding(.horizontal)
			.padding(.vertical, 8)
			
			List(coins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
					.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
		}
    }
}

struct HomeCoinListView_Previews: PreviewProvider {
	
	
    static var previews: some View {
		HomeCoinListView(coins: dev.viewModel.filteredCoins)
    }
}
