//
//  SelectedCoinInfoView.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct SelectedCoinInfoView: View {
	@Binding var selectedCoin: Coin?
	@Binding var amountText: String
	@Binding var currentPriceText: String
	
    var body: some View {
		VStack {
			HStack {
				Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""): ")
				Spacer()
				Text(selectedCoin?.currentPrice.asCurrencyString() ?? "")
			}
			Divider()
			HStack {
				Text("Amount holding:  ")
				Spacer()
				TextField("Ex: 2.0", text: $amountText)
					.multilineTextAlignment(.trailing)
					.keyboardType(.decimalPad)
			}
			Divider()
			HStack {
				Text("Current Value: ")
				Spacer()
				Text(currentPriceText)
			}
		}
		.animation(.none, value: selectedCoin)
		.font(.headline)
		.padding()
    }
}

struct SelectedCoinInfoView_Previews: PreviewProvider {
    static var previews: some View {
		SelectedCoinInfoView(selectedCoin: .constant(nil), amountText: .constant(""), currentPriceText: .constant("0.00"))
    }
}
