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
			Text(coin.name)
		} else {
			EmptyView()
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(viewModel: DetailViewModel(coin: dev.coin))
    }
}
