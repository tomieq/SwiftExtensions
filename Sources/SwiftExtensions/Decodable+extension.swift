//
//  Decodable+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

import Foundation

extension Decodable {
    
    init?(json: String) {
        let decoder = JSONDecoder()
        do {
            guard let txt = json.data(using: .utf8) else { return nil }
            self = try decoder.decode(Self.self, from: txt)
        } catch {
            print("json error: \(error)")
            return nil
        }
    }
    
    init?(json: Data) {
        let decoder = JSONDecoder()
        do {
            self = try decoder.decode(Self.self, from: json)
        } catch {
            print("json error: \(error)")
            return nil
        }
    }
}
