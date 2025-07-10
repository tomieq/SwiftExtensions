//
//  Enum+Equatable.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//
import Foundation

// enum where rawValue is UInt8 comparing with Data
public extension RawRepresentable where RawValue == UInt8 {
    static func == (lhs: Self, rhs: Data) -> Bool {
        lhs.rawValue.int == (try? rhs.int)
    }
    static func == (lhs: Data, rhs: Self) -> Bool {
        (try? lhs.int) == rhs.rawValue.int
    }
}
// enum where rawValue is UInt8 comparing with UInt8
public extension RawRepresentable where RawValue == UInt8 {
    static func == (lhs: Self, rhs: UInt8) -> Bool {
        lhs.rawValue == rhs
    }
    static func == (lhs: UInt8, rhs: Self) -> Bool {
        lhs == rhs.rawValue
    }
}

// enum where rawValue is UInt16 comparing with Data
public extension RawRepresentable where RawValue == UInt16 {
    static func == (lhs: Self, rhs: Data) -> Bool {
        lhs.rawValue.int == (try? rhs.int)
    }
    static func == (lhs: Data, rhs: Self) -> Bool {
        (try? lhs.int) == rhs.rawValue.int
    }
}
// enum where rawValue is UInt16 comparing with UInt16
public extension RawRepresentable where RawValue == UInt16 {
    static func == (lhs: Self, rhs: UInt16) -> Bool {
        lhs.rawValue == rhs
    }
    static func == (lhs: UInt16, rhs: Self) -> Bool {
        lhs == rhs.rawValue
    }
}

// enum where rawValue is Int comparing with Data
public extension RawRepresentable where RawValue == Int {
    static func == (lhs: Self, rhs: Data) -> Bool {
        lhs.rawValue == (try? rhs.int)
    }
    static func == (lhs: Data, rhs: Self) -> Bool {
        (try? lhs.int) == rhs.rawValue
    }
}
// enum where rawValue is Int comparing with Int
public extension RawRepresentable where RawValue == Int {
    static func == (lhs: Self, rhs: Int) -> Bool {
        lhs.rawValue == rhs
    }
    static func == (lhs: Int, rhs: Self) -> Bool {
        lhs == rhs.rawValue
    }
}
