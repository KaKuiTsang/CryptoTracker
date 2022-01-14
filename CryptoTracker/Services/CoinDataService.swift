//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by KaKui on 29/12/2021.
//

import Foundation
import OpenGLES

class CoinDataService {
	
	static func getCoins() async throws -> [Coin]  {
		guard let url =
				URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=true") else {
			throw URLError(.badURL)
		}
		
		let data = try await NetworkingManager.download(url: url)
		return try JSONDecoder().decode([Coin].self, from: data)
	}
	
	
	static func getStatistic() async throws -> MarketData {
		guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
			throw URLError(.badURL)
		}
		
		let data = try await NetworkingManager.download(url: url)
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let globalData = try decoder.decode(GlobalData.self, from: data)
		return globalData.data
	}
	
	static func getCoinDetail(with id: String) async throws  -> CoinDetail {
		guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
			throw URLError(.badURL)
		}
		
		let data = try await NetworkingManager.download(url: url)
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return try decoder.decode(CoinDetail.self, from: data)
	}
}
