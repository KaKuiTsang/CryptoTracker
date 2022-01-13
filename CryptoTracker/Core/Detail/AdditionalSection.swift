//
//  AdditionalSection.swift
//  CryptoTracker
//
//  Created by KaKui on 14/1/2022.
//

import SwiftUI

struct AdditionalSection: View {
	private let columns = [GridItem(.flexible()), GridItem(.flexible())]
	
	let stats: [Statistic]
	
    var body: some View {
		Text("Additional Detail")
			.font(.title)
			.bold()
			.foregroundColor(Color.theme.accentColor)
			.frame(maxWidth: .infinity, alignment: .leading)
		
		Divider()
		
		LazyVGrid(columns: columns, alignment: .leading, spacing: 30, pinnedViews: []) {
			ForEach(stats) { stat in
				StatisticView(stat: stat)
			}
		}
    }
}

struct AdditionalSection_Previews: PreviewProvider {
    static var previews: some View {
		AdditionalSection(stats: dev.viewModel.stats)
    }
}
