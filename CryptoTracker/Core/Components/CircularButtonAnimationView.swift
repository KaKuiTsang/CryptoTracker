//
//  CircularButtonAnimationView.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import SwiftUI

struct CircularButtonAnimationView: View {
	@Binding var shouldAnimate: Bool
	
    var body: some View {
        Circle()
			.stroke(lineWidth: 5)
			.scaleEffect(shouldAnimate ? 1 : 0)
			.opacity(shouldAnimate ? 0 : 1)
			.animation(
				shouldAnimate ? .easeInOut(duration: 0.8) : .none,
				value: shouldAnimate
			)
    }
}

struct CircularButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
		CircularButtonAnimationView(shouldAnimate: .constant(false))
			.foregroundColor(.red)
			.frame(width: 100, height: 100)
			.previewLayout(.sizeThatFits)
    }
}
