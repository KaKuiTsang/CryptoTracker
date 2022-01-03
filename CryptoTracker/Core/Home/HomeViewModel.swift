//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 28/12/2021.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	@Published var coins = [CoinModel]()
	@Published var filteredCoins = [CoinModel]()
	@Published var portfolioCoins = [CoinModel]()
	@Published var searchText = ""
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
	
	private func filterCoins(_ text: String, _ coins: [CoinModel]) -> [CoinModel] {
		guard !searchText.isEmpty else { return coins }
		let lowercasedText = searchText.lowercased()
		return coins.filter { coin -> Bool in
			return coin.name.lowercased().contains(lowercasedText)
			|| coin.symbol.lowercased().contains(lowercasedText)
			|| coin.id.lowercased().contains(lowercasedText)
		}
	}
}
