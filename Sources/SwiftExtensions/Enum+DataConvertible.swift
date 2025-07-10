//
//  Enum+DataConvertible.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//
import Foundation

public extension RawRepresentable where RawValue: DataConvertible {
    static func == (lhs: Self, rhs: DataConvertible) -> Bool {
        lhs.rawValue.data == rhs.data
    }
    static func == (lhs: DataConvertible, rhs: Self) -> Bool {
        lhs.data == rhs.rawValue.data
    }
}

extension RawRepresentable where RawValue: DataConvertible {
    public var data: Data {
        rawValue.data
    }
}
