//
//  String+Extensions.swift
//  CryptoTracker
//
//  Created by KaKui on 15/1/2022.
//

import Foundation

extension String {
	
	func removeHTMLTags() -> Self {
		return self
			.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
			.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
	}
}
