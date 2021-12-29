//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by KaKui on 29/12/2021.
//

import Foundation
import UIKit

class CoinDataService {
	
	static let shared = CoinDataService()
	
	private init() {}
	
	func getCoins() async throws -> [CoinModel]  {
		guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=hkd&order=market_cap_desc&per_page=25&page=1&sparkline=true") else {
			throw URLError(.badURL)
		}
		
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
			throw URLError(.badServerResponse)
		}
		
		return try JSONDecoder().decode([CoinModel].self, from: data)
	}
	
}
