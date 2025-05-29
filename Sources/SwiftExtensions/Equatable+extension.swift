//
//  Equatable+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 29/05/2025.
//

public extension Equatable {
    
    @discardableResult
    func on(_ other: Self, callback: () -> Void) -> Self {
        if self == other {
            callback()
        }
        return self
    }
    
    @discardableResult
    func on(_ other: Self, callback: () throws -> Void) throws -> Self {
        if self == other {
            try callback()
        }
        return self
    }
}
