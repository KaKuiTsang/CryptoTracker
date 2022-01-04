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
	
	func formattedWithAbbreviation() -> String {
		let num = abs(self)
		let signString = sign == .plus ? "" : "-"
		
		switch num {
		case 1_000_000_000_000...:
			let formatted = num / 1_000_000_000_000
			return signString + String(format: "%.2f", formatted) + "Tr"
		case 1_000_000_000...:
			let formatted = num / 1_000_000_000_000
			return signString + String(format: "%.2f", formatted) + "Bn"
		case 1_000_000...:
			let formatted = num / 1_000_000_000_000
			return signString + String(format: "%.2f", formatted) + "M"
		case 1_000...:
			let formatted = num / 1_000_000_000_000
			return signString + String(format: "%.2f", formatted) + "K"
		case 0...:
			return String(format: "%.2f", self)
		default:
			return "\(signString)\(self)"
		}
	}
}
