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
}

extension String {
    public func split(_ splitter: String) -> [String] {
        self.components(separatedBy: splitter)
    }
}
