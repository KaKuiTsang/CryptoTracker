//
//  PortfolioRepository.swift
//  CryptoTracker
//
//  Created by KaKui on 8/1/2022.
//

import Foundation
import CoreData

class PortfolioRepository {
	private let container: NSPersistentContainer
	private let containerName = "PortfolioContainer"
	private let entityName = "PortfolioEntity"
	
	init() {
		container = NSPersistentContainer(name: containerName)
		container.loadPersistentStores { _, error in
			if let error = error {
				print("Error loading CoreData: \(error)")
			}
		}
	}
	
	private func save() {
		do {
			try container.viewContext.save()
		} catch  {
			print("Error on saving to CoreData: \(error)")
		}
	}
	
	func getAllPortfolio() -> [PortfolioEntity] {
		let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
		
		do {
			return try container.viewContext.fetch(request)
		} catch {
			print("Error fetching Portfolio Entities: \(error)")
			return []
		}
	}
	
	func getPortfolio(of coinId: String) -> PortfolioEntity? {
		let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
		request.predicate = NSPredicate(format: "coinId == %@", coinId)
		request.fetchLimit = 1
		return try? container.viewContext.fetch(request).first
	}
	
	func create(coin: Coin, amount: Double) {
		let entity = PortfolioEntity(context: container.viewContext)
		entity.coinId = coin.id
		entity.amount = amount
		save()
	}
	
	func update(entity: PortfolioEntity, amount: Double) {
		entity.amount = amount
		save()
	}
	
	func delete(entity: PortfolioEntity) {
		container.viewContext.delete(entity)
		save()
	}
}
