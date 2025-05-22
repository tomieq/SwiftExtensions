//
//  Int+fromString.swift
//  SwiftExtensions
//
//  Created by Tomasz on 19/03/2025.
//

import Foundation

extension Int {
    public var hex: String {
        String(self, radix: 16)
    }

    public var binary: String {
        String(self, radix: 2)
    }

    public var decimal: String {
        String(self, radix: 10)
    }
}

extension Int {
    public init?(decimal: String) {
        self.init(decimal, radix: 10)
    }

    public init?(binary: String) {
        self.init(binary, radix: 2)
    }

    public init?(hex: String) {
        self.init(hex, radix: 16)
    }
}
