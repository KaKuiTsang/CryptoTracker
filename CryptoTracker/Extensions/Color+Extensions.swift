//
//  Color+Extensions.swift
//  CryptoTracker
//
//  Created by KaKui on 26/12/2021.
//

import Foundation
import SwiftUI

extension Color {
	static let colorTheme = ColorTheme()
}

struct ColorTheme {
	let accentColor = Color("AccentColor")
	let backgroundColor = Color("BackgroundColor")
	let greenColor = Color("GreenColor")
	let redColor = Color("RedColor")
	let secondaryTextColor = Color("SecondaryTextColor")
}
