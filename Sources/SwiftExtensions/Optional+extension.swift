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
