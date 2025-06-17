//
//  UInt24.swift
//  SwiftExtensions
//
//  Created by Tomasz on 17/06/2025.
//
import Foundation

public struct UInt24 {
    public let value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
    
    public var data: Data {
        Data([UInt8(value >> 16 & 0xFF),
              UInt8(value >> 8 & 0xFF),
              UInt8(value & 0xFF)])
    }
}
