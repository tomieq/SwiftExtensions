//
//  CompareTests.swift
//  SwiftExtensions
//
//  Created by Tomasz Kucharski on 10/07/2025.
//

import Testing
import SwiftExtensions
import Foundation

struct CompareTests {
    @Test func enumUInt8() {
        enum List: UInt8 {
            case five = 5
        }
        #expect(List.five == 5.uInt8)
        #expect(5.uInt8 == List.five)
        #expect(List.five == Data([5]))
        #expect(Data([5]) == List.five)
    }
    @Test func enumUInt16() {
        enum List: UInt16 {
            case five = 5
        }
        #expect(List.five == 5.uInt16)
        #expect(5.uInt16 == List.five)
        #expect(List.five == Data([0, 5]))
        #expect(Data([0, 5]) == List.five)
    }
    @Test func enumUInt() {
        enum List: Int {
            case five = 5
        }
        #expect(List.five == 5)
        #expect(5 == List.five)
        #expect(List.five == Data([5]))
        #expect(Data([5]) == List.five)
    }
}
