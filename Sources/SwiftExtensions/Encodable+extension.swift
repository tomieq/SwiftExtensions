//
//  Encodable+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

import Foundation

extension Encodable {
    public var json: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    public var jsonOneLine: String? {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
