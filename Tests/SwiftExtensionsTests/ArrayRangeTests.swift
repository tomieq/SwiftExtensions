//
//  ArrayRangeTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 16/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ArrayRangeTests {
    @Test func range() {
        let original = [0, 1, 2, 3, 4, 5, 6]
        #expect(original[safeRange: -5..<0] == [])
        #expect(original[safeRange: -5..<1] == [0])
        #expect(original[safeRange: 1..<3] == [1, 2])
        #expect(original[safeRange: 4..<6] == [4, 5])
        #expect(original[safeRange: 5..<9] == [5, 6])
        #expect(original[safeRange: 6..<19] == [6])
        #expect(original[safeRange: 16..<19] == [])
    }
    
    @Test func closedRange() {
        let original = [0, 1, 2, 3, 4, 5, 6]
        #expect(original[safeRange: (-5)...(-3)] == [])
        #expect(original[safeRange: -5...0] == [0])
        #expect(original[safeRange: -5...1] == [0, 1])
        #expect(original[safeRange: 1...3] == [1, 2, 3])
        #expect(original[safeRange: 4...6] == [4, 5, 6])
        #expect(original[safeRange: 5...9] == [5, 6])
        #expect(original[safeRange: 6...19] == [6])
        #expect(original[safeRange: 16...19] == [])
    }
    
    @Test func partialRangeFrom() {
        let original = [0, 1, 2, 3, 4, 5, 6]
        #expect(original[safeRange: (-5)...] == original)
        #expect(original[safeRange: 0...] == original)
        #expect(original[safeRange: 4...] == [4, 5, 6])
        #expect(original[safeRange: 5...] == [5, 6])
        #expect(original[safeRange: 6...] == [6])
        #expect(original[safeRange: 16...] == [])
    }
    
    @Test func partialRangeThrough() {
        let original = [0, 1, 2, 3, 4, 5, 6]
        #expect(original[safeRange: ...(-3)] == [])
        #expect(original[safeRange: ...0] == [0])
        #expect(original[safeRange: ...1] == [0, 1])
        #expect(original[safeRange: ...3] == [0, 1, 2, 3])
        #expect(original[safeRange: ...6] == original)
        #expect(original[safeRange: ...9] == original)
    }
    
    @Test func partialRangeUpTo() {
        let original = [0, 1, 2, 3, 4, 5, 6]
        #expect(original[safeRange: ..<(-3)] == [])
        #expect(original[safeRange: ..<0] == [])
        #expect(original[safeRange: ..<1] == [0])
        #expect(original[safeRange: ..<3] == [0, 1, 2])
        #expect(original[safeRange: ..<6] == [0, 1, 2, 3, 4, 5])
        #expect(original[safeRange: ..<9] == original)
    }
}
