//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by KaKui on 11/1/2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
	@Published var coin: Coin?
	@Published var coinDetail: CoinDetail? = nil
	@Published var overviewStatistics = [Statistic]()
	@Published var additionalStatistics = [Statistic]()
	
	private var cancellables = Set<AnyCancellable>()
	
	init(coin: Coin?) {
		self.coin = coin
		getCoinDetail()
		setupSubscribers()
	}

	private func getCoinDetail() {
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
	
	private func createOverviewStats(coin: Coin) -> [Statistic] {
		let price = coin.currentPrice.asCurrencyString()
		let priceChange = coin.priceChangePercentage24H
		let priceStat = Statistic(title: "Current Price", value: price, percentageChange: priceChange)
		
		let marketCap = "\(coin.marketCap?.formattedWithAbbreviation() ?? "")"
		let marketChange = coin.marketCapChangePercentage24H
		let marketStat = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketChange)
		
		let rankStat = Statistic(title: "Rank", value: "\(coin.rank)")
		
		let volume = "$\(coin.totalVolume?.formattedWithAbbreviation() ?? "")"
		let volumeStat = Statistic(title: "Volume", value: volume)
		
		return [priceStat, marketStat, rankStat, volumeStat]
	}
	
	private func createAdditionalStats(coin: Coin, coinDetail: CoinDetail?) -> [Statistic] {
		let high = coin.high24H?.asCurrencyString() ?? "N/A"
		let highStat = Statistic(title: "24h High", value: high)
		
		let low = coin.low24H?.asCurrencyString() ?? "N/A"
		let lowStat = Statistic(title: "24h Low", value: low)
		
		let priceChange24h = coin.priceChange24H?.asCurrencyString() ?? "N/A"
		let pricePercentChange24h = coin.priceChangePercentage24H
		let priceChange24hStat = Statistic(title: "24h Price Change", value: priceChange24h, percentageChange: pricePercentChange24h)
		
		let marketCapChange24h = "\(coin.marketCapChange24H?.formattedWithAbbreviation() ?? "")"
		let marketCapPercentChange24h = coin.marketCapChangePercentage24H
		let marketCapChange24hStat = Statistic(title: "24h Market Cap Change", value: marketCapChange24h, percentageChange: marketCapPercentChange24h)
		
		let blockTime = coinDetail?.blockTimeInMinutes ?? 0
		let blockTimeString = blockTime == 0 ? "N/A" : "\(blockTime) min"
		let blockTimeStat = Statistic(title: "Block Time", value: blockTimeString)
		
		let hashing = coinDetail?.hashingAlgorithm ?? "N/A"
		let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)
		
		return [
			highStat,
			lowStat,
			priceChange24hStat,
			marketCapChange24hStat,
			blockTimeStat,
			hashingStat
		]
	}
	
	private func setupSubscribers() {
		$coinDetail
			.combineLatest($coin)
			.filter({ _, coin in coin != nil })
			.map { [weak self] (coinDetail, coin) -> (overview: [Statistic], additional: [Statistic]) in
				guard let self = self else { return ([], []) }
				let overviewStats = self.createOverviewStats(coin: coin!)
				let additonalStats = self.createAdditionalStats(coin: coin!, coinDetail: coinDetail)
				return (overviewStats, additonalStats)
			}
			.sink(receiveValue: { [weak self] stats in
				self?.overviewStatistics = stats.overview
				self?.additionalStatistics = stats.additional
			})
			.store(in: &cancellables)
	}
}
