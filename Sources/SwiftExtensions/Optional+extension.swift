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
        return value
    }
}

public extension Optional where Wrapped == Array<Any> {
    var orEmpty: Wrapped {
        return []
    }
}
