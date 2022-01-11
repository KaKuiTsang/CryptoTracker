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
	@State private var showAddPortfolio = false
	
    var body: some View {
		ZStack {
			Color.theme.backgroundColor
				.ignoresSafeArea()
			
			VStack {
				HomeHeader(showPortfolio: $showPortfolio, showAddPortfolio: $showAddPortfolio)
				HomeStatView(stats: viewModel.stats, showPortfolio: $showPortfolio)
				SearchBarView(searchText: $viewModel.searchText)
				
				if !showPortfolio {
					// TODO: add sorting function
					HomeCoinListView(coins: viewModel.filteredCoins)
						.transition(.move(edge: .leading))
				}
				
				if showPortfolio {
					// TODO: add sorting function
					PortfolioCoinListView(coins: viewModel.portfolioCoins)
						.transition(.move(edge: .trailing))
				}
			}
		}
		.sheet(isPresented: $showAddPortfolio) {
			EditPortfolioView(homeViewModel: viewModel)
		}
		.task {
			// TODO: refactor
			await withTaskGroup(of: Void.self) { group in
				group.addTask {
					await viewModel.getCoins()
				}
				
				group.addTask {
					await viewModel.getStatistic()
				}
			}
		}
		.refreshable {
			// TODO: refactor
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
			.previewInterfaceOrientation(.portrait)
    }
}
