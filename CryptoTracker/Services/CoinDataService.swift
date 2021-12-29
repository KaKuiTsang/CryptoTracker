//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by KaKui on 29/12/2021.
//

import Foundation

class CoinDataService {
	
	static func getCoins() async throws -> [CoinModel]  {
		guard let url =
				URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=hkd&order=market_cap_desc&per_page=25&page=1&sparkline=true") else {
			throw URLError(.badURL)
		}
		
		let data = try await NetworkingManager.download(url: url)
		
		return try JSONDecoder().decode([CoinModel].self, from: data)
	}
	
}
