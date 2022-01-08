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
	@StateObject var viewModel = EditPortfolioViewModel()
	@FocusState private var isEditing: Bool
	
	var body: some View {
		NavigationView {
			GeometryReader { proxy in
				ScrollView(.vertical, showsIndicators: false) {
					VStack {
						SearchBarView(searchText: $homeViewModel.searchText)
						CoinSelectionListView(coins: $homeViewModel.filteredCoins, selectedCoin: $viewModel.selectedCoin)
						
						if viewModel.selectedCoin != nil {
							SelectedCoinInfoView(
								selectedCoin: $viewModel.selectedCoin,
								amountText: $viewModel.amountText,
								isEditing: $isEditing
							)
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
							.opacity(viewModel.showCheckmark ? 1 : 0)
						
						Button {
							isEditing = false
							viewModel.saveButtonTapped()
						} label: {
							Text("Save".uppercased())
						}
						.opacity(
							(viewModel.selectedCoin != nil && viewModel.selectedCoin?.currentHoldings != Double(viewModel.amountText)) ? 1 : 0
						)
					}
					.font(.headline)
				}
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
