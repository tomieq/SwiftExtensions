//
//  Comparable+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 29/05/2025.
//

public extension Comparable {
    func above(_ other: Self) -> Bool {
        self > other
    }

    func below(_ other: Self) -> Bool {
        self < other
    }
}
