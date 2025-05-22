//
//  Array+UInt8.swift
//  SwiftExtensions
//
//  Created by Tomasz on 25/04/2025.
//
import Foundation

extension Array where Element == UInt8 {
    public var data: Data {
        Data(self)
    }
}
