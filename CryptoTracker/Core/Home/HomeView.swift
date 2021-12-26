//
//  HomeView.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct HomeView: View {
	@State private var showPortfolio = false
	
    var body: some View {
		ZStack {
			Color.theme.backgroundColor
				.ignoresSafeArea()
			
			VStack {
				HomeHeader(showPortfolio: $showPortfolio)
				
				Spacer()
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
