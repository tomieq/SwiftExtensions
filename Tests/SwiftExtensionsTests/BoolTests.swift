//
//  BoolTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 23/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct BoolTests {
    @Test func and() {
        
        #expect(true.and(true))
        var flowControl = 0
        
        let result = false.and {
            flowControl = 1
            return true
        }
        #expect(result == false)
        #expect(flowControl == 0)
    }
}
