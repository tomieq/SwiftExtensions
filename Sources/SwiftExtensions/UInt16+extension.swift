//
//  UInt16+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 23/04/2025.
//

extension UInt16 {
    public var hexString: String {
        String(format: "%04hx", self)
    }
}
