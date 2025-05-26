//
//  ArrayTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 26/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ArrayTests {
    @Test func onEmpty() {
        var list = [1, 2, 3]
        var controlFlow = 0
        list.onEmpty {
            controlFlow = 1
        }
        #expect(controlFlow == 0)
        list.removeAll()
        list.onEmpty {
            controlFlow = 1
        }
        #expect(controlFlow == 1)
    }
}
