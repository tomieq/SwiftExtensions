//
//  UInt8+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 21/03/2025.
//
import Foundation

extension UInt8 {
    public var hexString: String {
        String(format: "%02hhX", self)
    }
    
    public var data: Data {
        Data([self])
    }
}

public extension UInt8 {
    var isMax: Bool {
        self == UInt8.max
    }
}

public extension UInt8 {
    var int: Int {
        Int(self)
    }
}

public extension UInt8 {
    func isBitSet(mask: UInt8) -> Bool {
        self & mask == mask
    }
}
