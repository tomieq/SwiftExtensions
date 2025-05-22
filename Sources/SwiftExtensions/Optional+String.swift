//
//  Optional+String.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

public extension Optional where Wrapped == String {
    var readable: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return "nil"
        }
    }
}
