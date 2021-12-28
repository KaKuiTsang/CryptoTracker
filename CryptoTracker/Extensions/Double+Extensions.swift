//
//  Double+Extensions.swift
//  CryptoTracker
//
//  Created by KaKui on 27/12/2021.
//

import Foundation

extension Double {
	
	private var currencyFormatter: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.usesGroupingSeparator = true
		formatter.currencySymbol = "$"
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 6
		return formatter
	}
	
	func asCurrencyString() -> String {
		currencyFormatter.string(from: NSNumber(value: self)) ?? "$0.00"
	}
	
	func asPercentString() -> String {
		String(format: "%.2f", self) + "%"
	}
}
