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
}

extension UInt24: DataConvertible {
    // big endian bytes
    public var data: Data {
        Data([UInt8(int >> 16 & 0xFF),
              UInt8(int >> 8 & 0xFF),
              UInt8(int & 0xFF)])
    }
}

extension UInt24 {
    public static var max: UInt24 {
        UInt24(16777215)
    }
}

public extension UInt24 {
    var isMax: Bool {
        self == UInt24.max
    }
}

extension UInt24: RawRepresentable {
    public typealias RawValue = Int
    
    public init?(rawValue: Int) {
        int = rawValue
    }
    
    public var rawValue: Int {
        self.int
    }
}

extension UInt24: Equatable {}
extension UInt24: Comparable {
    public static func < (lhs: UInt24, rhs: UInt24) -> Bool {
        lhs.int < rhs.int
    }
}

extension UInt24: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral value: Int) {
        self.int = value
    }
}
