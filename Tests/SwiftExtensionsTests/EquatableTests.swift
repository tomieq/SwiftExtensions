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
}
