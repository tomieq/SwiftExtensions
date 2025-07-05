//
//  UInt32+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/04/2025.
//
import Foundation

extension UInt32 {
    public var hexString: String {
        String(format: "%08X", self)
    }
    
    // big endian bytes
    public var data: Data {
        Data([UInt8(self >> 24 & 0xFF),
              UInt8(self >> 16 & 0xFF),
              UInt8(self >> 8 & 0xFF),
              UInt8(self & 0xFF)])
    }
}

public extension UInt32 {
    var isMax: Bool {
        self == UInt32.max
    }
}

public extension UInt32 {
    var int: Int {
        Int(self)
    }
}
