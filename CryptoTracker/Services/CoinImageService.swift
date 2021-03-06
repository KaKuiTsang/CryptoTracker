//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by KaKui on 31/12/2021.
//

import SwiftUI

class CoinImageService {
	
	static func getCoinImage(urlString: String) async -> Image? {
		guard let url = URL(string: urlString) else { return nil }
		let imageNmae = urlString.replacingOccurrences(of: "/", with: "")
		
		if let image = ImageFileManager.shared.getImage(imageName: imageNmae) {
			return Image(uiImage: image)
		}
		
		do {
			let data = try await NetworkingManager.download(url: url)
			guard let image = UIImage(data: data) else { return nil }
			
			Task.detached {
				await ImageFileManager.shared.saveImage(imageName: imageNmae, image: image)
			}
			
			return Image(uiImage: image)
		} catch {
			print(error)
			return nil
		}
	}
	
}
