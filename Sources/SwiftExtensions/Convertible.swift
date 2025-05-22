//
//  Convertible.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

public protocol Convertible {}
extension Convertible {
    public func map<T>(converter: (Self) -> T) -> T {
        converter(self)
    }
}
