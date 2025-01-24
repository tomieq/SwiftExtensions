//
//  String+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//
import Foundation

extension String {
    var trimmed: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    func split(_ splitter: String) -> [String] {
        self.components(separatedBy: splitter)
    }
}
