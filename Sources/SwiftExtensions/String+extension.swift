//
//  String+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//
import Foundation

extension String {
    public var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    public func trimming(_ characters: String) -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: characters))
    }
}

extension String {
    public func split(_ splitter: String) -> [String] {
        self.components(separatedBy: splitter)
    }
}
