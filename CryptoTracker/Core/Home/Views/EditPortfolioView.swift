//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct EditPortfolioView: View {
	@Environment(\.presentationMode) var presentationMode
	@ObservedObject var homeViewModel: HomeViewModel
	@State private var selectedCoin: Coin? = nil
	@State private var amountText = ""
	@State private var showCheckmark = false
	@FocusState private var isEditing: Bool
	
	var body: some View {
		NavigationView {
			GeometryReader { proxy in
				ScrollView(.vertical, showsIndicators: false) {
					VStack {
						SearchBarView(searchText: $homeViewModel.searchText)
						
						CoinSelectionListView(coins: $homeViewModel.filteredCoins, selectedCoin: $selectedCoin)
						
						if selectedCoin != nil {
							SelectedCoinInfoView(selectedCoin: $selectedCoin, amountText: $amountText, isEditing: $isEditing)
						}
						
						Spacer()
						
						//SaveButton()

					}
					.frame(minHeight: proxy.size.height)
				}

			}
			.navigationTitle("Edit Portfolio")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					CloseButton {
						presentationMode.wrappedValue.dismiss()
					}
				}
				
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack(spacing: 0) {
						Image(systemName: "checkmark")
							.opacity(showCheckmark ? 1 : 0)
						
						Button {
							saveButtonTapped()
						} label: {
							Text("Save".uppercased())
						}
						.opacity(
							(selectedCoin != nil && selectedCoin?.currentHoldings != Double(amountText)) ? 1 : 0
						)
					}
					.font(.headline)
				}
			}
		}
	}
	
	private func saveButtonTapped() {
		selectedCoin = nil
		amountText = ""
		isEditing = false
		
		withAnimation(.easeIn) {
			showCheckmark = true
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			withAnimation(.easeIn) {
				showCheckmark = false
			}
		}
	}
}

struct PortfolioView_Previews: PreviewProvider {
	static var previews: some View {
		EditPortfolioView(homeViewModel: dev.viewModel)
			.preferredColorScheme(.dark)
			.task {
				await dev.viewModel.getCoins()
			}
	}
}
