//
//  HomeView.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct HomeView: View {
	@StateObject private var viewModel = HomeViewModel()
	@State private var showPortfolio = false
	
    var body: some View {
		ZStack {
			Color.theme.backgroundColor
				.ignoresSafeArea()
			
			VStack {
				HomeHeader(showPortfolio: $showPortfolio)
				
				HomeStatView(stats: viewModel.stats, showPortfolio: $showPortfolio)
				
				SearchBarView(searchText: $viewModel.searchText)
				
				if showPortfolio {
					portfolioList
						.transition(.move(edge: .trailing))
				}
				
				if !showPortfolio {
					priceList
						.transition(.move(edge: .leading))
				}
			}
		}
		.task {
			await withTaskGroup(of: Void.self) { group in
				group.addTask {
					await viewModel.getCoins()
				}
				
				group.addTask {
					await viewModel.getStatistic()
				}
			}
			
		}
    }
	
	var priceList: some View {
		VStack(spacing: 0) {
			HStack {
				Text("Coin")
				Spacer()
				Text("Price")
			}
			.font(.caption)
			.foregroundColor(Color.theme.secondaryTextColor)
			.padding(.horizontal)
			.padding(.vertical, 8)
			
			List(viewModel.filteredCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
					.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
		}
	}
	
	var portfolioList: some View {
		VStack(spacing: 0) {
			HStack {
				Text("Coin")
				Spacer()
				Text("Holdings")
				Spacer()
				Text("Price")
			}
			.font(.caption)
			.foregroundColor(Color.theme.secondaryTextColor)
			.padding(.horizontal)
			
			List(viewModel.portfolioCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: true)
					.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
					.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
			
		}
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
			.previewInterfaceOrientation(.portrait)
    }
}
