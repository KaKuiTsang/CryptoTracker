//
//  NetworkManager.swift
//  CryptoTracker
//
//  Created by KaKui on 29/12/2021.
//

import Foundation

class NetworkingManager {
	
	enum NetworkingError: LocalizedError {
		case badURLResponse(url: URL)
		case unknow
		
		var errorDescription: String {
			switch self {
			case .badURLResponse(let url):
				return "[🔥] Bad response from URL: \(url)"
			case .unknow:
				return "[⚠️] Unknown error occurred."
			}
		}
	}
	
	static func download(url: URL) async throws -> Data {
		let (data, response) = try await URLSession.shared.data(from: url)
		
		guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
			throw NetworkingError.badURLResponse(url: url)
		}
		
		return data
	}
	
}
