//
//  ComparableTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 29/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ComparableTests {
    @Test func below() {
        #expect(30.below(50))
        #expect(1.7.below(2.5))
    }

    @Test func above() {
        #expect(60.above(50))
        #expect(2.6.above(2.5))
    }
}
