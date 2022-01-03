//
//  Statistic.swift
//  CryptoTracker
//
//  Created by KaKui on 3/1/2022.
//

import Foundation

struct Statistic: Identifiable, Codable {
	let id = UUID().uuidString
	let title: String
	let value: String
	private(set) var percentageChange: Double? = nil
}
