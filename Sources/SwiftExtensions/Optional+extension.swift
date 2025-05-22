//
//  Optional+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Optional {
    public var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }

    public var notNil: Bool {
        !self.isNil
    }
}

public extension Optional {
    func or(_ value: Wrapped) -> Wrapped {
        self ?? value
    }
    func or(_ block: () -> Wrapped) -> Wrapped {
        self ?? block()
    }
}

public extension Optional {
    func cast<T>(to: T.Type = T.self) -> T? {
        self as? T
    }
    
    func map<T>(_ transform: (Wrapped) -> T) -> T? {
        flatMap(transform)
    }
    
    func map<T>(_ transform: (Wrapped) throws -> T) -> T? {
        try? flatMap(transform)
    }
}

public extension Optional {
    @discardableResult
    func onValue(_ callback: (Wrapped) -> Void) -> Wrapped? {
        switch self {
        case .none:
            break
        case .some(let value):
            callback(value)
        }
        return self
    }

    @discardableResult
    func onNil(_ callback: () -> Void) -> Wrapped? {
        switch self {
        case .none:
            callback()
        case .some:
            break
        }
        return self
    }
}
