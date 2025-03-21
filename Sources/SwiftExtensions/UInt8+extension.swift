//
//  UInt8+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 21/03/2025.
//

extension UInt8 {
    public var hexString: String {
        String(format: "%02hhx", self)
    }
}
