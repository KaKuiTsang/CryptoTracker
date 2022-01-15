//
//  CoinDetail.swift
//  CryptoTracker
//
//  Created by KaKui on 11/1/2022.
//

import Foundation

struct CoinDetail: Codable, Identifiable {
	let id, symbol, name: String
	let blockTimeInMinutes: Int?
	let hashingAlgorithm: String?
	let categories: [String?]?
	let description: Description
	let links: Links?
	
	var readableDescription: String? {
		description.en?.removeHTMLTags()
	}
}

struct Links: Codable {
	let homepage: [String]?
	let subredditUrl: String?
}

struct Description: Codable {
	let en: String?
}

