//
//  Array+functional.swift
//  SwiftExtensions
//
//  Created by Tomasz on 26/05/2025.
//

public extension Array {
    @discardableResult
    func onEmpty(_ closure: () -> Void) -> Self {
        if isEmpty {
            closure()
        }
        return self
    }

    @discardableResult
    func onEmpty(_ closure: () throws -> Void) throws -> Self {
        if isEmpty {
            try closure()
        }
        return self
    }
}

public extension Array {
    @discardableResult
    func collect(_ closure: ([Element]) -> Void) -> Self {
        closure(self)
        return self
    }

    @discardableResult
    func collect(_ closure: ([Element]) throws -> Void) throws -> Self {
        try closure(self)
        return self
    }
}
