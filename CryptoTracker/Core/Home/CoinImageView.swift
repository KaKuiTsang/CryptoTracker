//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by KaKui on 30/12/2021.
//

import SwiftUI

struct CoinImageView: View {
	@State private var isLoading = false
	@State private var image: Image?
	
	let urlString: String
	
    var body: some View {
		ZStack {
			if let image = image {
				image.resizable().scaledToFit()
			} else {
				Image(systemName: "questionmark")
					.foregroundColor(Color.theme.secondaryTextColor)
					.opacity(isLoading ? 0 : 1)
			}
			
			ProgressView().opacity(isLoading ? 1 : 0)
		
		}
		.task {
			isLoading = true
			image = await CoinImageService.getCoinImage(urlString: urlString)
			isLoading = false
		}
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
		CoinImageView(urlString: dev.coin.image)
			.padding()
			.previewLayout(.sizeThatFits)
    }
}
