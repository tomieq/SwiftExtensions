//
//  Data+compare.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//
import Foundation

public extension Data {
    // Data and UInt8 comparison
    static func == (lhs: UInt8, rhs: Self) -> Bool {
        lhs == (try? rhs.uInt8)
    }
    static func == (lhs: Self, rhs: UInt8) -> Bool {
        (try? lhs.uInt8) == rhs
    }
    // Data and UInt16 comparison
    static func == (lhs: UInt16, rhs: Self) -> Bool {
        lhs == (try? rhs.uInt16)
    }
    static func == (lhs: Self, rhs: UInt16) -> Bool {
        (try? lhs.uInt16) == rhs
    }
    // Data and UInt32 comparison
    static func == (lhs: UInt32, rhs: Self) -> Bool {
        lhs == (try? rhs.uInt32)
    }
    static func == (lhs: Self, rhs: UInt32) -> Bool {
        (try? lhs.uInt32) == rhs
    }
    // Data and UInt64 comparison
    static func == (lhs: UInt64, rhs: Self) -> Bool {
        lhs == (try? rhs.uInt64)
    }
    static func == (lhs: Self, rhs: UInt64) -> Bool {
        (try? lhs.uInt64) == rhs
    }
    // Data and Int comparison
    static func == (lhs: Int, rhs: Self) -> Bool {
        lhs == (try? rhs.int)
    }
    static func == (lhs: Self, rhs: Int) -> Bool {
        (try? lhs.int) == rhs
    }
}
