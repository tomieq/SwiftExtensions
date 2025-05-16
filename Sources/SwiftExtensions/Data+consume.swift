//
//  Data+consume.swift
//  SwiftExtensions
//
//  Created by Tomasz on 16/05/2025.
//

import Foundation

extension Data {
    mutating public func consume(bytes: Int) -> Data {
        let consumed = self.slice(..<bytes)
        self = slice(bytes...)
        return consumed
    }
}
