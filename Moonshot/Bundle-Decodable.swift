//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Nowroz Islam on 17/7/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String, withExtension ext: String) -> T {
        guard let url = self.url(forResource: file, withExtension: ext) else {
            fatalError("Failed to locate \(file).\(ext) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file).\(ext) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decodedContent = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data loaded from \(file).\(ext).")
        }
        
        return decodedContent
    }
}
