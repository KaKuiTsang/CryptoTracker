//
//  SaveButton.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct SaveButton: View {
	let action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			Text("Save")
				.foregroundColor(Color.black)
				.font(.headline)
		}
		.frame(maxWidth: .infinity)
		.frame(height: 54)
		.background(
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.theme.greenColor)
		)
		.padding()
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
		SaveButton(action: {})
    }
}
