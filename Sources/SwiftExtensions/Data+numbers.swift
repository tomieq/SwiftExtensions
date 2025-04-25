//
//  Data+numbers.swift
//  SwiftExtensions
//
//  Created by Tomasz on 25/04/2025.
//
import Foundation

extension Data {
    // big endian
    public var uInt8: UInt8 {
        UInt8(self[0])
    }
    // big endian
    public var uInt16: UInt16 {
        UInt16(self[0]) << 8 + UInt16(self[1])
    }

    // big endian
    public var uInt32: UInt32 {
        UInt32(self[0]) << 24 + UInt32(self[1]) << 16 + UInt32(self[2]) << 8 + UInt32(self[3])
    }
}
