//
//  MarketData.swift
//  CryptoTracker
//
//  Created by KaKui on 4/1/2022.
//

import Foundation

struct GlobalData: Codable {
	let data: MarketData
}

struct MarketData: Codable {

	let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
	let marketCapChangePercentage24HUsd: Double
	
	var marketCap: String {
		guard let item = totalMarketCap.first(where: { $0.key == "hkd" }) else { return "" }
		return "$\(item.value.formattedWithAbbreviation())"
	}
	
	var volume: String {
		guard let item = totalVolume.first(where: { $0.key == "hkd" }) else { return "" }
		return "$\(item.value.formattedWithAbbreviation())"
	}
	
	var btcDominance: String {
		guard let item = marketCapPercentage.first(where: { $0.key == "btc" }) else { return "" }
		return item.value.asPercentString()
	}
}
