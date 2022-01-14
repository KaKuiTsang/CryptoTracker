//
//  ChartView.swift
//  CryptoTracker
//
//  Created by KaKui on 14/1/2022.
//

import Foundation
import SwiftUI

struct ChartView: View {
	private let data: [Double]
	private let maxY: Double
	private let minY: Double
	private let midY: Double
	private let range: Double
	private let lineColor: Color
	private let endDate: Date
	private let startDate: Date
	@State private var percentage: CGFloat = 0
	
	init(coin: Coin) {
		data = coin.sparklineIn7D?.price ?? []
		maxY = data.max() ?? 0
		minY = data.min() ?? 0
		midY = (maxY + minY) / 2
		range = maxY - minY
		let priceChange = (data.last ?? 0) - (data.first ?? 0)
		lineColor = priceChange > 0 ? Color.theme.greenColor : Color.theme.redColor
		endDate = (try? Date(coin.lastUpdated ?? "", strategy: .iso8601)) ?? Date.now
		startDate = endDate.addingTimeInterval(-7 * 24 * 60 * 60)
	}
	
	var body: some View {
		VStack(spacing: 8) {
			sparklineView
				.background(chartBackground)
				.overlay(chartYAxis, alignment: .leading)
			dateRow
				.padding(.horizontal, 4)
		}
		.font(.caption)
		.foregroundColor(Color.theme.secondaryTextColor)
		.frame(height: 240)
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
				withAnimation(.linear(duration: 1.4)) {
					percentage = 1
				}
			}
		}
	}
	
	private var sparklineView: some View {
		GeometryReader { proxy in
			Path { path in
				for index in data.indices {
					let xPosition = (proxy.size.width / CGFloat(data.count)) * CGFloat(index + 1)
					
					let yPosition = (maxY - data[index]) / range * proxy.size.height
					
					if index == 0 {
						path.move(to: CGPoint(x: 0, y: yPosition))
					}
					
					path.addLine(to: CGPoint(x: xPosition, y: yPosition))
				}
			}
			.trim(from: 0, to: percentage)
			.stroke(
				lineColor,
				style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round)
			)
			.shadow(color: lineColor, radius: 10, x: 0, y: 10)
			.shadow(color: lineColor.opacity(0.5), radius: 10, x: 0, y: 20)
			.shadow(color: lineColor.opacity(0.2), radius: 10, x: 0, y: 30)
			.shadow(color: lineColor.opacity(0.1), radius: 10, x: 0, y: 40)
		}
	}
	
	private var chartBackground: some View {
		VStack {
			Divider()
			Spacer()
			Divider()
			Spacer()
			Divider()
		}
	}
	
	private var chartYAxis: some View {
		VStack {
			Text(maxY.formattedWithAbbreviation())
			Spacer()
			Text(midY.formattedWithAbbreviation())
			Spacer()
			Text(minY.formattedWithAbbreviation())
		}
		.padding(.leading, 4)
	}
	
	private var dateRow: some View {
		HStack {
			Text(
				startDate
					.formatted(
						.dateTime.month(.twoDigits).day(.twoDigits).year(.twoDigits)
					)
			)
			
			Spacer()
			
			Text(
				endDate
					.formatted(
						.dateTime.month(.twoDigits).day(.twoDigits).year(.twoDigits)
					)
			)
		}
	}
}

struct ChartView_Previews: PreviewProvider {
	static var previews: some View {
		ChartView(coin: dev.coin)
	}
}
