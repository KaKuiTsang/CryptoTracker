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
	@State private var showEditPortfolio = false
	@State private var showSettings = false
	
    var body: some View {
		ZStack {
			Color.theme.backgroundColor
				.ignoresSafeArea()
			
			VStack {
				HomeHeader(showPortfolio: $showPortfolio, showEditPortfolio: $showEditPortfolio, showSettings: $showSettings)
					.sheet(isPresented: $showSettings) {
						SettingsView()
					}
				
				HomeStatView(stats: viewModel.stats, showPortfolio: $showPortfolio)
					.sheet(isPresented: $showEditPortfolio) {
						EditPortfolioView(homeViewModel: viewModel)
					}
				
				SearchBarView(searchText: $viewModel.searchText)
				
				if !showPortfolio {
					HomeCoinListView(coins: viewModel.filteredCoins)
						.transition(.move(edge: .leading))
				}
				
				if showPortfolio {
					PortfolioCoinListView(coins: viewModel.portfolioCoins)
						.transition(.move(edge: .trailing))
				}
			}
		}
		.task {
			await viewModel.refresh()
		}
		.refreshable {
			await viewModel.refresh()
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
			.previewInterfaceOrientation(.portrait)
    }
}
