//
//  StatisticView.swift
//  CryptoTracker
//
//  Created by KaKui on 3/1/2022.
//

import SwiftUI

struct StatisticView: View {
	let stat: Statistic
	
    var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(stat.title)
				.font(.caption)
				.foregroundColor(Color.theme.secondaryTextColor)
			
			Text(stat.value)
				.font(.headline)
				.foregroundColor(Color.theme.accentColor)
			
			HStack(spacing: 4) {
				Image(systemName: "triangle")
					.symbolVariant(.fill)
					.font(.caption2)
					.rotationEffect(
						Angle(
							degrees: (stat.percentageChange ?? 0) > 0 ? 0 : 180
						)
					)
				
				Text(stat.percentageChange?.asPercentString() ?? "")
					.font(.caption)
					.bold()
			}
			.foregroundColor(
				(stat.percentageChange ?? 0) > 0
					? Color.theme.greenColor
					: Color.theme.redColor
			)
			.opacity(
				stat.percentageChange == nil ? 0 : 1
			)
		}
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			StatisticView(stat: dev.stat1)
				.previewLayout(.sizeThatFits)
			
			StatisticView(stat: dev.stat2)
				.previewLayout(.sizeThatFits)
			
			StatisticView(stat: dev.stat3)
				.previewLayout(.sizeThatFits)
		}
    }
}
