//
//  Data+append.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//

import Foundation

public extension Data {
    func appending(_ other: DataConvertible) -> Data {
        var copy = self
        copy.append(other.data)
        return copy
    }
    func appending<T>(_ other: any RawRepresentable<T>) -> Data where T: DataConvertible {
        var copy = self
        copy.append(other.rawValue.data)
        return copy
    }
    // aliases
    func appending(asOneByte number: Int) -> Data {
        appending(number.uInt8)
    }
    func appending(asTwoBytes number: Int) -> Data {
        appending(number.uInt16)
    }
    func appending(asThreeBytes number: Int) -> Data {
        appending(number.uInt24)
    }
    func appending(asFourBytes number: Int) -> Data {
        appending(number.uInt32)
    }
}

public extension Data {
    mutating func append(asOneByte number: Int) {
        append(number.uInt8)
    }
    mutating func append(asTwoBytes number: Int) {
        append(number.uInt16.data)
    }
    mutating func append(asThreeBytes number: Int) {
        append(number.uInt24.data)
    }
    mutating func append(asFourBytes number: Int) {
        append(number.uInt32.data)
    }
    mutating func append<T>(_ other: any RawRepresentable<T>) where T: DataConvertible {
        self.append(other.rawValue.data)
    }
}
