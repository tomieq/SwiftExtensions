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
}

public extension Optional {
    func cast<T>(to: T.Type = T.self) -> T? {
        self as? T
    }
    
    func map<T>(_ transform: (Wrapped) throws -> T) -> T? {
        try? flatMap(transform)
    }
}
