//
//  OptionalTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//



import Testing
import Foundation
import SwiftExtensions

struct OptionalTests {
    
    private func produce<T>(_ value: T?) -> T? {
        value
    }
    
    @Test func recover() {
        var value = produce(5).or(12)
        #expect(value == 5)
        value = produce(nil).or(10)
        #expect(value == 10)
    }
}
