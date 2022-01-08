//
//  EditPortfolioViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 8/1/2022.
//

import SwiftUI
import Combine

class EditPortfolioViewModel: ObservableObject {
	@Published var selectedCoin: Coin? = nil
	@Published var amountText = ""
	@Published var showCheckmark = false
	
	private func finishSelection() {
		selectedCoin = nil
		amountText = ""
	}
	
	func saveButtonTapped() {
		finishSelection()
		
		withAnimation(.easeIn) {
			showCheckmark = true
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			withAnimation(.easeIn) {
				self?.showCheckmark = false
			}
		}
	}
}
