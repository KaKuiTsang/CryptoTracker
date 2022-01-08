//
//  CoinSelectionListView.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct CoinSelectionListView: View {
	@Binding var coins: [Coin]
	@Binding var selectedCoin: Coin?
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack(spacing: 10) {
				ForEach(coins) { coin in
					CoinSelectionCell(coin: coin)
						.frame(width: 75)
						.padding(6)
						.background(
							RoundedRectangle(cornerRadius: 10)
								.stroke(
									selectedCoin?.id == coin.id
									? Color.theme.greenColor
									: Color.clear,
									lineWidth: 1
								)
						)
						.onTapGesture {
							withAnimation(.easeIn(duration: 0.2)) {
								selectedCoin = coin
							}
						}
				}
			}
			.frame(height: 120, alignment: .center)
			.padding(.vertical, 4)
			.padding(.horizontal)
		}
    }
}

struct CoinSelectionListView_Previews: PreviewProvider {
    static var previews: some View {
		CoinSelectionListView(coins: .constant([]), selectedCoin: .constant(nil))
    }
}
