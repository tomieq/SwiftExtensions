//
//  Enum+Data+init.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//
import Foundation

public extension RawRepresentable where RawValue == UInt8 {
    init?(data: Data) {
        guard let number = try? data.uInt8 else {
            return nil
        }
        self.init(rawValue: number)
    }
}
public extension RawRepresentable where RawValue == UInt16 {
    init?(data: Data) {
        guard let number = try? data.uInt16 else {
            return nil
        }
        self.init(rawValue: number)
    }
}
public extension RawRepresentable where RawValue == UInt32 {
    init?(data: Data) {
        guard let number = try? data.uInt32 else {
            return nil
        }
        self.init(rawValue: number)
    }
}
public extension RawRepresentable where RawValue == Int {
    init?(data: Data) {
        guard let number = try? data.int else {
            return nil
        }
        self.init(rawValue: number)
    }
}
