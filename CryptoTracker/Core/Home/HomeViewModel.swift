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
	private let portfolioRepo = PortfolioRepository()
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		$searchText
			.combineLatest($coins)
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.assign(to: &$filteredCoins)
		
		$portfolioCoins
			.drop(while: { [weak self] _ in
				guard let self = self else { return false }
				return self.stats.isEmpty
			})
			.map(getPortfolioValue)
			.sink(receiveValue: { [weak self] portfolioStat in
				guard let self = self else { return }
				self.stats[self.stats.count - 1] = portfolioStat
			})
			.store(in: &cancellables)
	}
	
	private func filterCoins(_ text: String, _ coins: [Coin]) -> [Coin] {
		guard !searchText.isEmpty else { return coins }
		let lowercasedText = searchText.lowercased()
		return coins.filter { coin -> Bool in
			coin.name.lowercased().contains(lowercasedText)
			|| coin.symbol.lowercased().contains(lowercasedText)
			|| coin.id.lowercased().contains(lowercasedText)
		}
	}
	
	private func getPortfolioValue(from coins: [Coin]) -> Statistic {
		let value = coins.map({ $0.currentHoldingsValue }).reduce(0, +)
		
		let previousValue = coins
			.map { coin -> Double in
				let currentValue = coin.currentHoldingsValue
				let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
				let preioviosValue = currentValue / (1 + percentChange)
				return preioviosValue
			}
			.reduce(0, +)
		
		let percentageChange: Double = previousValue > 0 ? ((value - previousValue) / previousValue) * 100 : 0
		
		return Statistic(title: "Portfolio Value", value: value.asCurrencyString(), percentageChange: percentageChange)
	}
	
	@MainActor
	func getCoins() async {
		do {
			coins = try await CoinDataService.getCoins()
			getAllPortfolio()
		} catch {
			dump(error)
		}
	}
	
	@MainActor
	func getAllPortfolio() {
		let entities = portfolioRepo.getAllPortfolio()
		portfolioCoins = entities.compactMap { entity -> Coin? in
			var coin = coins.first(where: { coin in coin.id == entity.coinId } )
			coin?.updateCurrentHoldings(amount: entity.amount)
			return coin
		}
	}
	
	@MainActor
	func getStatistic() async {
		do {
			
			let data = try await CoinDataService.getStatistic()
			let portfolioStat = getPortfolioValue(from: portfolioCoins)
			
			stats = [
				Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd),
				Statistic(title: "24h Volume", value: data.volume),
				Statistic(title: "BTC Dominance", value: data.btcDominance),
				portfolioStat,
			]
			
		} catch {
			dump(error)
		}
	}
}
