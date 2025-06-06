//
//  Int+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Int {
    public var incremented: Int {
        self + 1
    }

    public var decremented: Int {
        self - 1
    }
}

extension Int {
    public mutating func increment() {
        self += 1
    }

    public mutating func decrement() {
        self -= 1
    }
}

public extension Int {
    var isMax: Bool {
        self == Int.max
    }
}
