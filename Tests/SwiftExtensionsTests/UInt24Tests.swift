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
        #expect(UInt24(rawValue: Data(hexString: "FFFFFF"))?.data.hexString == "FFFFFF")
    }
}
