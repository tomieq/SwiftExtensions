//
//  UInt16+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 23/04/2025.
//
import Foundation

extension UInt16 {
    public var hexString: String {
        String(format: "%04hX", self)
    }
}

extension UInt16: DataConvertible {
    // big endian bytes order
    public var data: Data {
        Data([UInt8(self >> 8), UInt8(self & 0xFF)])
    }
}

public extension UInt16 {
    var isMax: Bool {
        self == UInt16.max
    }
}

public extension UInt16 {
    var int: Int {
        Int(self)
    }
}

public extension UInt16 {
    func isBitSet(mask: UInt16) -> Bool {
        self & mask == mask
    }
}
