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
	@Published var stats = [Statistic]()
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
	
	@MainActor
	func getStatistic() async {
		do {
			
			let data = try await CoinDataService.getStatistic()
			
			stats = [
				Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd),
				Statistic(title: "24h Volume", value: data.volume),
				Statistic(title: "BTC Dominance", value: data.btcDominance),
				Statistic(title: "Portfolio Value", value: "$0.00", percentageChange: 0),
			]
			
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
