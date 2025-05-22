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

extension String {
    public func chunked(by chunkSize: Int) -> [String] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            self.subString($0, Swift.min($0 + chunkSize, self.count))
        }
    }
}

extension String {
    public func subString(_ from: Int, _ to: Int) -> String {
        if self.count < to {
            return self
        }

        let start = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: to)

        let range = start..<end
        return String(self[range])
    }
}

extension String {
    public func removed(text: String) -> String {
        self.replacingOccurrences(of: text, with: "")
    }
    
    public var array: [String] {
        self.map { String($0) }
    }
}

extension String {
    public var bytes: [UInt8] {
        return [UInt8](self.utf8)
    }
}
