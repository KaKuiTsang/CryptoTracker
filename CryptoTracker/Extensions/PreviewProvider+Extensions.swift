//
//  PreviewProvider+Extension.swift
//  CryptoTracker
//
//  Created by KaKui on 27/12/2021.
//

import SwiftUI

#if DEBUG
extension PreviewProvider {
	static var dev: DeveloperPreview {
		DeveloperPreview.shared
	}
}

class DeveloperPreview {
	
	static let shared = DeveloperPreview()
	
	private init() { }
	
	let viewModel = HomeViewModel()
	
	let coin = Coin(
		id: "bitcoin",
		symbol: "btc",
		name: "Bitcoin",
		image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
		currentPrice: 400801,
		marketCapRank: 1,
		marketCap: 7573191500550,
		fullyDilutedValuation: 8409117883275,
		totalVolume: 162134301260,
		high24H: 401268,
		low24H: 388847,
		priceChange24H: 11478.76,
		priceChangePercentage24H: 2.94839,
		marketCapChange24H: 210751677723,
		marketCapChangePercentage24H: 2.86252,
		circulatingSupply: 18912450,
		totalSupply: 21000000,
		maxSupply: 21000000,
		ath: 537865,
		athChangePercentage: -25.39816,
		athDate: "2021-11-10T14:24:11.849Z",
		atl: 514.37,
		atlChangePercentage: 77908.70035,
		atlDate: "2013-07-05T00:00:00.000Z",
		lastUpdated: "2021-12-27T13:58:13.078Z",
		sparklineIn7D: SparklineIn7D(price: [
			46098.84107229724,
			45723.105158529055,
			45869.09984438979,
			46305.41472401088,
			46040.98689173658,
			46490.88829546849,
			46351.75689570818,
			46274.047062355865,
			46792.46741866742,
			47446.94044903319,
			47269.102922925056,
			47033.22355853823,
			47117.008204210455,
			47046.020323027784,
			47090.00311163663,
			47066.17426144169,
			48110.79713668988,
			48680.1669880337,
			48694.30902163804,
			48685.75878494196,
			48728.21390597622,
			48651.6920353309,
			48810.84651689541,
			48881.21021790502,
			48932.65976291626,
			49192.42067381922,
			49024.966485146084,
			48803.48450160706,
			48597.70326793641,
			48893.490251657546,
			48747.67695707271,
			48628.11146340804,
			48654.77255886986,
			48692.22089380968,
			49264.381527892656,
			49341.61801683935,
			49058.23886266777,
			48886.99055366998,
			48901.05693684124,
			49716.031099945765,
			49346.51378716346,
			49346.51378716346,
			49456.370880963776,
			49127.02629648502,
			49266.78175713441,
			49395.261821003696,
			49452.27047121205,
			48958.87553997625,
			49279.903471700105,
			49126.09740878841,
			49088.212163225224,
			49140.83274795939,
			49249.47127997279,
			49222.88595974255,
			49217.870337663095,
			49139.640439658244,
			49113.2022935964,
			49247.59578895621,
			49230.10053650318,
			49252.904173545714,
			49101.85946706944,
			48755.89564404483,
			48489.90371853652,
			48656.43073416629,
			48582.79701317183,
			48731.87480518833,
			48540.735193419656,
			48542.84511949181,
			48567.220678760226,
			48316.72416646556,
			48499.15320448264,
			48554.32063981056,
			48630.74089648213,
			48644.618777548676,
			48866.95257714488,
			48871.58219077016,
			48770.98960201174,
			48999.104166773104,
			49214.16836686329,
			50304.24274085634,
			50740.62435990282,
			51290.70450858861,
			51091.795805396156,
			50936.87482607152,
			50934.22606007381,
			50927.61393294162,
			51020.81855157362,
			51426.68133518721,
			51108.32079787615,
			51105.18006055235,
			51196.20199181731,
			51103.05254090408,
			51044.70372645789,
			51059.84003796907,
			51178.29795181915,
			51446.87620013985,
			51288.103777410535,
			51029.05066848744,
			51169.738065872465,
			51252.66713914666,
			51117.174786922384,
			51041.8620299827,
			51064.5354329467,
			51244.50702275757,
			51792.35925373034,
			51280.98226131559,
			51267.763178697925,
			51067.45673256646,
			50844.54285479484,
			50888.72103678683,
			51208.60100307716,
			51039.11260321934,
			51003.72418422215,
			50958.62798106325,
			51002.85529512428,
			50986.93432298546,
			51090.55936940921,
			51024.65923185132,
			51014.99232720438,
			50900.904367554656,
			50743.08703025897,
			50761.235925190646,
			50938.35293346375,
			51025.75922421066,
			50833.64269229362,
			50816.142569402815,
			50685.00622673602,
			50720.52898789745,
			51127.5239513987,
			50946.63664698467,
			50988.060005168365,
			51058.03177531956,
			50726.18721081179,
			50478.270127814576,
			50526.56400932845,
			50683.85917175965,
			50134.46783693883,
			49851.151929186046,
			49944.502661949264,
			49952.25932713078,
			49997.57850231792,
			50105.39124868097,
			49938.51328603023,
			50209.44481971789,
			50179.62011968331,
			49789.473916292096,
			50029.27110734424,
			49894.06540195892,
			50068.48442540984,
			50123.936068163865,
			50524.250490937186,
			50356.053142205725,
			50270.05255238667,
			50441.46535964392,
			50394.119657092,
			51013.56670541574,
			51097.34570105861,
			50868.792929154675,
			50653.72166806718,
			51013.18326147839,
			50923.45151240389,
			51083.355646472824,
			51085.00065777153,
			50939.66089253609,
			51033.38245246494,
			50742.94049557504,
			50621.897547035995,
			50887.91727645382,
			50942.965283096164
		]),
		currentHoldings: 10)
}

#endif
