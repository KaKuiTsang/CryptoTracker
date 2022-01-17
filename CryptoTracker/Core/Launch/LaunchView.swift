//
//  LaunchView.swift
//  CryptoTracker
//
//  Created by KaKui on 17/1/2022.
//

import SwiftUI

struct LaunchView: View {
	@Binding var showLaunchView: Bool
	@State private var showLoadingText = false
	@State private var counter = 0
	private let loadingText = "Loading your portfolio...".map { String($0) }
	private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
	
    var body: some View {
		ZStack {
			Color.black.ignoresSafeArea()
			
			Image("logo-transparent")
				.resizable()
				.scaledToFill()
				.frame(width: 100, height: 100)
				

			if showLoadingText {
				ZStack {
					HStack(spacing: 0) {
						ForEach(loadingText.indices) { index in
							Text(loadingText[index])
								.foregroundColor(Color.theme.accentColor)
								.offset(y: (counter % loadingText.count) == index ? -8 : 0 )
						}
					}
				}
				.offset(y: 80)
				.transition(AnyTransition.opacity.animation(.easeInOut))
			}
			
		}
		.ignoresSafeArea()
		.onAppear {
			showLoadingText.toggle()
		}
		.onReceive(timer) { time in
			
			if counter > loadingText.count * 2 {
				withAnimation(.spring()) {
					showLaunchView = false
				}
			} else {
				withAnimation(.spring()) {
					counter += 1
				}
			}
		}
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
		LaunchView(showLaunchView: .constant(true))
    }
}
