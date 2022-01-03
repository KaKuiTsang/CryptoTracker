//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 28/12/2021.
//

import Foundation

class HomeViewModel: ObservableObject {
	@Published var coins = [CoinModel]()
	@Published var portfolioCoins = [CoinModel]()
	@Published var searchText = ""
	
	init() {}
	
	@MainActor
	func getCoins() async {
		do {
			coins = try await CoinDataService.getCoins()
		} catch {
			dump(error)
		}
	}
}
