//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 11/1/2022.
//

import Foundation

class DetailViewModel: ObservableObject {
	@Published var coinDetail: CoinDetail? = nil
	
	let coin: Coin?
	
	init(coin: Coin?) {
		self.coin = coin
		getCoinDetail()
	}

	func getCoinDetail() {
		guard let coin = coin else { return }
		
		Task {
			do {
				let coinDetail = try await CoinDataService.getCoinDetail(with: coin.id)
				
				DispatchQueue.main.async {
					self.coinDetail = coinDetail
				}
				
			} catch  {
				print("error on geting coin detail: \(error)")
			}
		}
	}
}
