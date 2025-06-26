//
//  Convertible.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//
import Foundation

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
}

extension String: Convertible {}
extension Bool: Convertible {}
extension Data: Convertible {}
extension Date: Convertible {}
extension Int: Convertible {}

