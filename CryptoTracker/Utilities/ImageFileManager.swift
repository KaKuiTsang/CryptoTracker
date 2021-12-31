//
//  ImageFileManager.swift
//  CryptoTracker
//
//  Created by KaKui on 31/12/2021.
//

import Foundation
import UIKit

class ImageFileManager {
	
	static let shared = ImageFileManager()
	
	private init() { }
	
	private func getFilePath(imageName: String) -> URL? {
		guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
		return url.appendingPathComponent(imageName)
	}
	
	func saveImage(imageName: String, image: UIImage) async {
		guard let data = image.pngData(), let url = getFilePath(imageName: imageName) else { return }
		
		do {
			try data.write(to: url)
		} catch {
			print(error)
		}
	}
	
	func getImage(imageName: String) -> UIImage? {
		guard let url = getFilePath(imageName: imageName), FileManager.default.fileExists(atPath: url.path) else { return nil }
		return UIImage(contentsOfFile: url.path)
	}
}
