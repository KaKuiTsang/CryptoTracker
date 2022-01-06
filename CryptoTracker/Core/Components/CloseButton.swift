//
//  CloseButton.swift
//  CryptoTracker
//
//  Created by KaKui on 6/1/2022.
//

import SwiftUI

struct CloseButton: View {
	var action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			Image(systemName: "xmark")
				.font(.headline)
		}
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
		CloseButton(action: {})
			.previewLayout(.sizeThatFits)
    }
}
