//
//  Int+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//
import Foundation

extension Int {
    public var incremented: Int {
        self + 1
    }

    public var decremented: Int {
        self - 1
    }
}

extension Int {
    public mutating func increment() {
        self += 1
    }

    public mutating func decrement() {
        self -= 1
    }
}

public extension Int {
    var isMax: Bool {
        self == Int.max
    }
}

public extension Int {
    /// converts Int do Data (big-endian), with minimal byte number
    var data: Data {
        var bytes: [UInt8] = []
        repeat {
            let byte = UInt8(truncatingIfNeeded: self >> ((bytes.count) * 8))
            bytes.insert(byte, at: 0)
        } while (self >> (bytes.count * 8)) != 0
        return Data(bytes)
    }
}
