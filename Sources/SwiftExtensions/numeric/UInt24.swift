//
//  UInt24.swift
//  SwiftExtensions
//
//  Created by Tomasz on 17/06/2025.
//
import Foundation

public struct UInt24 {
    public let int: Int
    
    public init(_ value: Int) {
        self.int = value
    }
    
    public var data: Data {
        Data([UInt8(int >> 16 & 0xFF),
              UInt8(int >> 8 & 0xFF),
              UInt8(int & 0xFF)])
    }
}
