//
//  CoinModel.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import Foundation
import SwiftUI

// MARK: - CoinModel
struct CoinModel: Identifiable, Codable {
	let id, symbol, name: String
	let image: String
	let currentPrice: Double
	let marketCapRank: Int
	let marketCap, fullyDilutedValuation: Double?
	let totalVolume, high24H, low24H: Double?
	let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
	let circulatingSupply, totalSupply, maxSupply, ath: Double?
	let athChangePercentage: Double?
	let athDate: String?
	let atl, atlChangePercentage: Double?
	let atlDate: String?
	let lastUpdated: String?
	let sparklineIn7D: SparklineIn7D?
	var currentHoldings: Double = 0
	
	var currentHoldingsValue: Double {
		currentHoldings * currentPrice
	}
	
	var rank: Int {
		marketCapRank
	}
	
	var percentageChangeColor: Color {
		guard let priceChangePercentage24H = priceChangePercentage24H else {
			return Color.theme.secondaryTextColor
		}
		
		return priceChangePercentage24H.sign == .plus
			? Color.theme.greenColor
			: Color.theme.redColor
	}

	enum CodingKeys: String, CodingKey {
		case id, symbol, name, image
		case currentPrice = "current_price"
		case marketCap = "market_cap"
		case marketCapRank = "market_cap_rank"
		case fullyDilutedValuation = "fully_diluted_valuation"
		case totalVolume = "total_volume"
		case high24H = "high_24h"
		case low24H = "low_24h"
		case priceChange24H = "price_change_24h"
		case priceChangePercentage24H = "price_change_percentage_24h"
		case marketCapChange24H = "market_cap_change_24h"
		case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case maxSupply = "max_supply"
		case ath
		case athChangePercentage = "ath_change_percentage"
		case athDate = "ath_date"
		case atl
		case atlChangePercentage = "atl_change_percentage"
		case atlDate = "atl_date"
		case lastUpdated = "last_updated"
		case sparklineIn7D = "sparkline_in_7d"
		//case currentHoldings
	}
	
	mutating func updateCurrentHoldings(amount: Double) {
		currentHoldings = amount
	}
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
	let price: [Double]?
}
