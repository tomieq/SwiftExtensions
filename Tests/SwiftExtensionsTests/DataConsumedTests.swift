//
//  DataConsumedTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 16/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct DataConsumedTests {
    @Test func consume() {
        var data = Data([0, 2, 3, 4, 5, 6])
        #expect(data.consume(bytes: 2) == Data([0, 2]))
        #expect(data == Data([3, 4, 5, 6]))
        #expect(data.consume(bytes: 1) == Data([3]))
        #expect(data == Data([4, 5, 6]))
        #expect(data.consume(bytes: 3) == Data([4, 5, 6]))
        #expect(data == Data())
        #expect(data.consume(bytes: 3) == Data())
        #expect(data == Data())
    }
}
