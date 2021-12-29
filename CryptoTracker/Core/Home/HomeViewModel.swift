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
	
	init() {}
	
	@MainActor
	func getCoins() async {
		do {
			coins = try await CoinDataService.shared.getCoins()
		} catch {
			print(error)
		}
	}
}
