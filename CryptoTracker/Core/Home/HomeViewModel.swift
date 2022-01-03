//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 28/12/2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	@Published var coins = [Coin]()
	@Published var filteredCoins = [Coin]()
	@Published var portfolioCoins = [Coin]()
	@Published var searchText = ""
	@Published var stats = [
		Statistic(title: "MarketCap", value: "$12.5Bn", percentageChange: 25.24),
		Statistic(title: "Total Volume", value: "$1.23Tr"),
		Statistic(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.32),
		Statistic(title: "Stat 4", value: "$123.4k", percentageChange: 20.32)
	]
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		$searchText
			.combineLatest($coins)
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.assign(to: &$filteredCoins)
	}
	
	@MainActor
	func getCoins() async {
		do {
			coins = try await CoinDataService.getCoins()
		} catch {
			dump(error)
		}
	}
	
	private func filterCoins(_ text: String, _ coins: [Coin]) -> [Coin] {
		guard !searchText.isEmpty else { return coins }
		let lowercasedText = searchText.lowercased()
		return coins.filter { coin -> Bool in
			return coin.name.lowercased().contains(lowercasedText)
			|| coin.symbol.lowercased().contains(lowercasedText)
			|| coin.id.lowercased().contains(lowercasedText)
		}
	}
}
