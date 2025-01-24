//
//  Optional+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Optional {
    var isNil: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return false
        }
    }

    var notNil: Bool {
        !self.isNil
    }
}
