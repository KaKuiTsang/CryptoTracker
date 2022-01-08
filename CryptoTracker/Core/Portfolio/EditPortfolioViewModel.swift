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
	@Published var currentPriceText = "0.00"
	@Published var showCheckmark = false
	private let portfolioRepo = PortfolioRepository()
	
	init() {
		$selectedCoin
			.combineLatest($amountText)
			.map(getCurrentValue)
			.map({ $0.asCurrencyString() })
			.assign(to: &$currentPriceText)
	}
	
	private func getCurrentValue(selectedCoin: Coin?, amountText: String) -> Double {
		guard let amount = Double(amountText), let selectedCoin = selectedCoin else { return 0 }
		return amount * selectedCoin.currentPrice
	}
	
	private func finishSelection() {
		selectedCoin = nil
		amountText = ""
	}
	
	private func updatePortfolio() {
		guard let amount = Double(amountText), let selectedCoin = selectedCoin else { return }
		
		guard let entity = portfolioRepo.getPortfolio(of: selectedCoin.id) else {
			return portfolioRepo.create(coin: selectedCoin, amount: amount)
		}
		
		guard amount > 0 else {
			return portfolioRepo.delete(entity: entity)
		}
				
		portfolioRepo.update(entity: entity, amount: amount)
	}
	
	func saveButtonTapped() {
		updatePortfolio()
		finishSelection()
		withAnimation(.easeIn) { showCheckmark = true }

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
			withAnimation(.easeIn) {
				self?.showCheckmark = false
			}
		}
	}
	
	func endEditing() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
