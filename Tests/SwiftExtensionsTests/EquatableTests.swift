//
//  EquatableTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 29/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct EquatableTests {
    
    @Test func onWithEnum() {
        enum Country {
            case poland
            case germany
        }
        
        var flowControl = 0
        Country.poland
            .on(.poland) {
                flowControl = 1
            }.on(.germany) {
                flowControl = 2
            }
        #expect(flowControl == 1)
    }
    
    @Test func onWithInt() {
        
        var flowControl = 0

        100.on(100) {
                flowControl = 1
            }
            .on(101) {
                flowControl = 2
            }
        #expect(flowControl == 1)
    }
    
    @Test func dataWithUInt8() throws {
        enum List: UInt8 {
            case four = 4
            case five = 5
        }
        let data = Data([4])
        #expect(data == List.four)
        #expect((data == List.five).not)
        #expect(try data.uInt8 == List.four)
        #expect((try data.uInt8 == List.five).not)
    }
    
    @Test func dataWithUInt16() throws {
        enum List: UInt16 {
            case four = 4
            case five = 5
        }
        let data = Data([0, 4])
        #expect(data == List.four)
        #expect((data == List.five).not)
        #expect(try data.uInt16 == List.four)
        #expect((try data.uInt16 == List.five).not)
    }
    
    @Test func dataWithInt() throws {
        enum List: Int {
            case four = 4
            case five = 5
        }
        let data = Data([4])
        #expect(data == List.four)
        #expect((data == List.five).not)
        #expect(try data.int == List.four)
        #expect((try data.int == List.five).not)
    }
}
