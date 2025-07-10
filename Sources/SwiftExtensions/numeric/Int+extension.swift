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

extension Int: DataConvertible {
    /// converts Int do Data (big-endian), with minimal byte number
    public var data: Data {
        var bytes: [UInt8] = []
        repeat {
            let byte = UInt8(truncatingIfNeeded: self >> ((bytes.count) * 8))
            bytes.insert(byte, at: 0)
        } while (self >> (bytes.count * 8)) != 0
        return Data(bytes)
    }
}

// convenient converters
public extension Int {
    var uInt8: UInt8 {
        UInt8(truncatingIfNeeded: self)
    }
    var uInt16: UInt16 {
        UInt16(truncatingIfNeeded: self)
    }
    var uInt24: UInt24 {
        UInt24(self)
    }
    var uInt32: UInt32 {
        UInt32(truncatingIfNeeded: self)
    }
}
