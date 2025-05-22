//
//  ZipTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ZipTests {
    
    private func optional(_ value: Int?) -> Int? {
        value
    }
    
    @Test func twoArguments() {
        #expect(zip(optional(nil), optional(nil)).isNil)
        #expect(zip(optional(nil), optional(2)).isNil)
        #expect(zip(optional(1), optional(nil)).isNil)
        
        let zip = zip(optional(1), optional(2))
        #expect(zip.notNil)
        #expect(zip.map { $0 + $1 } == 3)
    }
    
    @Test func threeArguments() {
        #expect(zip(optional(nil), optional(nil), optional(nil)).isNil)
        #expect(zip(optional(nil), optional(nil), optional(2)).isNil)
        #expect(zip(optional(nil), optional(2), optional(2)).isNil)
        #expect(zip(optional(1), optional(nil), optional(nil)).isNil)
        #expect(zip(optional(1), optional(1), optional(nil)).isNil)
        
        let zip = zip(optional(1), optional(2), optional(3))
        #expect(zip.notNil)
        #expect(zip.map { $0 + $1 + $2 } == 6)
    }
}
