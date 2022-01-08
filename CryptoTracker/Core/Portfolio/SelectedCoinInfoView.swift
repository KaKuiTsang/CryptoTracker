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
	var isEditing: FocusState<Bool>.Binding
	
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
					.focused(isEditing)
			}
			Divider()
			HStack {
				Text("Current Value: ")
				Spacer()
				Text(String(format: "%.2f", getCurrentValue()))
			}
		}
		.animation(.none, value: selectedCoin)
		.font(.headline)
		.padding()
    }
	
	private func getCurrentValue() -> Double {
		guard let amount = Double(amountText), let selectedCoin = selectedCoin else { return 0 }
		return amount * selectedCoin.currentPrice
	}
}

struct SelectedCoinInfoView_Previews: PreviewProvider {
	@FocusState static var isEditing: Bool
	
    static var previews: some View {
		SelectedCoinInfoView(selectedCoin: .constant(nil), amountText: .constant(""), isEditing: $isEditing)
    }
}
