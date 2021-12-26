//
//  CircularButtonAnimationView.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct CircularButtonAnimationView: View {
	@Binding var animation: Bool
	
    var body: some View {
        Circle()
			.stroke(lineWidth: 5)
			.scaleEffect(animation ? 1 : 0)
			.opacity(animation ? 0 : 1)
			.animation(
				animation ? .easeInOut(duration: 0.8) : .none,
				value: animation
			)
    }
}

struct CircularButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
		CircularButtonAnimationView(animation: .constant(false))
			.foregroundColor(.red)
			.frame(width: 100, height: 100)
			.previewLayout(.sizeThatFits)
    }
}
