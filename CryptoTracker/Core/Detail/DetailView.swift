//
//  DetailView.swift
//  CryptoTracker
//
//  Created by KaKui on 11/1/2022.
//

import SwiftUI

struct DetailView: View {
	@ObservedObject var viewModel: DetailViewModel
	
    var body: some View {
		if let coin = viewModel.coin {
			ScrollView {
				VStack(spacing: 20) {
					ChartView(coin: coin)
						.padding(.vertical)
					
					OverviewSection(stats: viewModel.overviewStatistics)
					
					AdditionalSection(stats: viewModel.additionalStatistics)
				}
				.padding()
			}
			.navigationTitle(coin.name)
		} else {
			EmptyView()
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView {
			DetailView(viewModel: DetailViewModel(coin: dev.coin))
		}
    }
}
