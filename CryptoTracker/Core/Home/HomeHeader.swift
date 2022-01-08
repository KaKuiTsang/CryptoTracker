//
//  HomeHeader.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct HomeHeader: View {
	@Binding var showPortfolio: Bool
	@Binding var showAddPortfolio: Bool
	
    var body: some View {
		HStack {
			CircularButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.background(CircularButtonAnimationView(shouldAnimate: $showPortfolio))
				.onTapGesture {
					if showPortfolio {
						showAddPortfolio.toggle()
					}
				}
			
			Spacer()
			
			Text(showPortfolio ? "Portfolio" : "Live Prices")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundColor(Color.theme.accentColor)
				.animation(.none)
			
			Spacer()
			
			CircularButtonView(iconName: "chevron.right")
				.rotationEffect(showPortfolio ? Angle(degrees: 180) : Angle(degrees: 0))
				.onTapGesture {
					withAnimation(.spring()) {
						showPortfolio.toggle()
					}
				}
		}
		.padding(.horizontal)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
		HomeHeader(showPortfolio: .constant(false), showAddPortfolio: .constant(false))
			.previewLayout(.sizeThatFits)
    }
}
