//
//  Optional+operator.swift
//  SwiftExtensions
//
//  Created by Tomasz on 21/05/2025.
//

infix operator ?!: NilCoalescingPrecedence

public func ?!<T>(value: T?, error: @autoclosure () -> Error) throws -> T {
    guard let value = value else { throw error() }
    return value
}
