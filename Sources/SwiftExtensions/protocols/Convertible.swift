//
//  Convertible.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

public protocol Convertible {}
extension Convertible {
    public func convert<T>(converter: (Self) -> T) -> T {
        converter(self)
    }
    public func convert<T>(converter: (Self) -> T?) -> T? {
        converter(self)
    }
    public func convert<T>(converter: (Self) throws -> T) throws -> T {
        try converter(self)
    }
    public func convert<T>(converter: (Self) throws -> T?) throws -> T? {
        try converter(self)
    }

    public func map<T>(converter: (Self) -> T) -> T {
        converter(self)
    }
}
