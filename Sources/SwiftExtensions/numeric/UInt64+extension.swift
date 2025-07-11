//
//  UInt64+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//
import Foundation

extension UInt64 {
    public var hexString: String {
        String(format: "%08X", self)
    }
}

extension UInt64: DataConvertible {
    // big endian bytes, as withUnsafeBytes(of: number.bigEndian) { Data($0) }
    public var data: Data {
        Data([UInt8(self >> 56 & 0xFF),
              UInt8(self >> 48 & 0xFF),
              UInt8(self >> 40 & 0xFF),
              UInt8(self >> 32 & 0xFF),
              UInt8(self >> 24 & 0xFF),
              UInt8(self >> 16 & 0xFF),
              UInt8(self >> 8 & 0xFF),
              UInt8(self & 0xFF)])
    }
}

public extension UInt64 {
    var isMax: Bool {
        self == UInt64.max
    }
}
