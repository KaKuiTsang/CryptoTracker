//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by KaKui on 27/12/2021.
//

import SwiftUI

struct CoinRowView: View {

	let coin: CoinModel
	
	var showHoldingsColumn = true
	
	var coinRankTextView: some View {
		Text("\(coin.rank)")
			.font(.caption)
			.foregroundColor(Color.theme.secondaryTextColor)
			.frame(minWidth: 30)
	}
	
	var coinImageView: some View {
		AsyncImage(url: URL(string: coin.image)) { image in
			image
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 30)
				.clipShape(Circle())
		} placeholder: {
			ProgressView()
		}
	}
	
	var coinSymbolView: some View {
		Text(coin.symbol.uppercased())
			.font(.headline)
			.padding(.leading, 8)
			.foregroundColor(Color.theme.accentColor)
	}
	
	var holdingsColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentHoldingsValue.asCurrencyString())
				.bold()
			Text(String(format: "%.2f", coin.currentHoldings))
		}
	}
	
	var valueColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentPrice.asCurrencyString())
				.bold()
				.foregroundColor(Color.theme.accentColor)
			
			Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
				.foregroundColor(coin.percentageChangeColor)
		}
		.frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
	}
	
    var body: some View {
		HStack(spacing: 0) {
			coinRankTextView
			coinImageView
			coinSymbolView
			
			Spacer()
			
			if showHoldingsColumn {
				holdingsColumn
			}
			
			valueColumn
		}
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			CoinRowView(coin: dev.coin)
				.previewLayout(.sizeThatFits)
			
			CoinRowView(coin: dev.coin)
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}
    }
}
