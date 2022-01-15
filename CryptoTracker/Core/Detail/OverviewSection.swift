//
//  OverviewSection.swift
//  CryptoTracker
//
//  Created by KaKui on 14/1/2022.
//

import SwiftUI

struct OverviewSection: View {
	@EnvironmentObject var viewModel: DetailViewModel
	
	private let columns = [GridItem(.flexible()), GridItem(.flexible())]
	let stats: [Statistic]
	
    var body: some View {
		Text("Overview")
			.font(.title)
			.bold()
			.foregroundColor(Color.theme.accentColor)
			.frame(maxWidth: .infinity, alignment: .leading)
		
		Divider()
		
		if !viewModel.description.isEmpty {
			DescriptionView(description: viewModel.description)
		}
		
		LazyVGrid(columns: columns, alignment: .leading, spacing: 30, pinnedViews: []) {
			ForEach(stats) { stat in
				StatisticView(stat: stat)
			}
		}
    }
}

struct OverviewSection_Previews: PreviewProvider {
    static var previews: some View {
		OverviewSection(stats: dev.viewModel.stats)
			.environmentObject(dev.viewModel)
    }
}
