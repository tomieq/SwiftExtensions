//
//  Bool+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Bool {
    public var not: Bool {
        !self
    }
}

public extension Bool {
    @discardableResult
    func onTrue(_ closure: () -> Void) -> Self {
        if self {
            closure()
        }
        return self
    }
    
    @discardableResult
    func onFalse(_ closure: () -> Void) -> Self {
        if not {
            closure()
        }
        return self
    }
    
    @discardableResult
    func always(_ closure: () -> Void) -> Self {
        closure()
        return self
    }
}


public extension Bool {
    @discardableResult
    func and(_ other: Bool) -> Bool {
        self && other
    }

    @discardableResult
    func or(_ other: Bool) -> Bool {
        self || other
    }
}
