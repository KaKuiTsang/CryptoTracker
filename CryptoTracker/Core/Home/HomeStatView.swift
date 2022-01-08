//
//  HomeStatView.swift
//  CryptoTracker
//
//  Created by KaKui on 3/1/2022.
//

import SwiftUI

struct HomeStatView: View {
	let stats: [Statistic]
	
	@Binding var showPortfolio: Bool
	
    var body: some View {
		HStack {
			ForEach(stats) { stat in
				StatisticView(stat: stat)
					.frame(width: UIScreen.main.bounds.width / 3)
			}
		}
		.frame(
			width: UIScreen.main.bounds.width,
			alignment: showPortfolio ? .trailing : .leading
		)
    }
}

struct HomeStatView_Previews: PreviewProvider {
    static var previews: some View {
		HomeStatView(stats: [dev.stat1, dev.stat2, dev.stat3, dev.stat4], showPortfolio: .constant(false))
    }
}
