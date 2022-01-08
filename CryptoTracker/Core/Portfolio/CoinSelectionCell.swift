//
//  SelectCoinView.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct CoinSelectionCell: View {
	let coin: Coin
	
    var body: some View {
		VStack {
			CoinImageView(urlString: coin.image)
				.frame(width: 50, height: 50)
				
			Text(coin.symbol.uppercased())
				.font(.headline)
				.foregroundColor(Color.theme.accentColor)
				.lineLimit(1)
				.minimumScaleFactor(0.5)
			
			Text(coin.name)
				.font(.caption)
				.foregroundColor(Color.theme.secondaryTextColor)
				.lineLimit(2)
				.minimumScaleFactor(0.5)
				.multilineTextAlignment(.center)
		}
    }
}

struct SelectCoinView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			CoinSelectionCell(coin: dev.coin)
				.previewLayout(.sizeThatFits)

			CoinSelectionCell(coin: dev.coin)
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}
    }
}
