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
    func orThrow(_ error: @autoclosure () -> Error) throws -> Wrapped {
        guard let value = self else { throw error() }
        return value
    }
}

public extension Optional {
    func cast<T>(to: T.Type = T.self) -> T? {
        self as? T
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
    func onValue(_ callback: (Wrapped) throws -> Void) throws -> Wrapped? {
        switch self {
        case .none:
            break
        case .some(let value):
            try callback(value)
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
    
    @discardableResult
    func onNil(_ callback: () throws -> Void) throws -> Wrapped? {
        switch self {
        case .none:
            try callback()
        case .some:
            break
        }
        return self
    }
}

public extension Optional {
    init(_ block: () throws -> Wrapped?) {
        self = try? block()
    }
}


public extension Optional {
    @discardableResult
    func map<N>(_ callback: (Wrapped) -> N?) -> N? {
        switch self {
        case .none:
            nil
        case .some(let value):
            callback(value)
        }
    }
}
