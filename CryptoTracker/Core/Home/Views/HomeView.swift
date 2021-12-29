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
			
			List(viewModel.coins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
					.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
			.transition(.move(edge: .leading))
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
	
    var body: some View {
		ZStack {
			Color.theme.backgroundColor
				.ignoresSafeArea()
			
			VStack {
				HomeHeader(showPortfolio: $showPortfolio)
				
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
			await viewModel.getCoins()
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
			.previewInterfaceOrientation(.portrait)
    }
}
