//
//  DetailView.swift
//  CryptoTracker
//
//  Created by KaKui on 11/1/2022.
//

import SwiftUI

struct DetailView: View {
	let coin: Coin?
	
    var body: some View {
		Text(coin?.name ?? "")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(coin: dev.coin)
    }
}
