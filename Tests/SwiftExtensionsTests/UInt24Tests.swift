//
//  UInt24Tests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 08/08/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct UInt24Tests {
    @Test
    func maxValue() {
        #expect(UInt24.max.data.hexString == "FFFFFF")
    }

    @Test
    func fromRawValue() {
        #expect(UInt24(rawValue: 16777215)?.data.hexString == "FFFFFF")
    }
    
    @Test
    func sum() {
        #expect(UInt24(10) + UInt24(34) == UInt24(44))
        
        let first: UInt24 = 10
        let second: UInt24 = 34
        let sum = first + second
        
        #expect(sum == 44)
    }
}
