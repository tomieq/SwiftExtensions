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
    
    @Test func collect() {
        let list = [1, 2, 3]
        var controlFlow = 0
        list.collect { elements in
            controlFlow = 1
            #expect(elements == list)
        }
        #expect(controlFlow == 1)
    }
    
    @Test func tupleGetter() throws {
        let array = [1, 2, 3, 5]
        
        #expect(try array.tuple == (1, 2))
    }
    
    @Test func zip2() {
        let array = [1, 2, 3, nil, 5]
        
        let tuples = array
            .unpacked()
            .zip { number in
                number * 6
            }
        let expected = [(1, 6), (2, 12), (3, 18), (5, 30)]
        
        for (index, tuple) in tuples.enumerated() {
            #expect(tuple == expected[index])
        }
    }
    
    @Test func zip3() {
        let list = [1, 2, 3]
        let result = list
            .zip { element in
                element.hex
            }
            .zip { one, two in
                one * 2
            }
        #expect(result[0] == (1, "1", 2))
        #expect(result[1] == (2, "2", 4))
        #expect(result[2] == (3, "3", 6))
    }
    
    @Test func zip4() {
        let list = [1, 2, 3]
        let result = list
            .zip { element in
                element.hex
            }
            .zip { one, _ in
                one * 2
            }
            .zip { _, _, three in
                three.hex
            }
        #expect(result[0] == (1, "1", 2, "2"))
        #expect(result[1] == (2, "2", 4, "4"))
        #expect(result[2] == (3, "3", 6, "6"))
    }
    
    
    @Test func compactZip2() {
        let array = [1, 2, 3, 4, 5]
        
        let tuples = array
            .compactZip { number in
                number == 4 ? nil : number * 6
            }
        let expected = [(1, 6), (2, 12), (3, 18), (5, 30)]
        
        for (index, tuple) in tuples.enumerated() {
            #expect(tuple == expected[index])
        }
    }
    
    @Test func compactZip3() {
        let list = [1, 2, 3]
        let result = list
            .zip { element in
                element.hex
            }
            .compactZip { one, _ in
                one == 2  ? nil : one * 2
            }
        #expect(result[0] == (1, "1", 2))
        #expect(result[1] == (3, "3", 6))
    }
    
    @Test func compactZip4() {
        let list = [1, 2, 3]
        let result = list
            .zip { element in
                element.hex
            }
            .zip { one, _ in
                one * 2
            }
            .compactZip { _, _, three in
                three.below(5) ? three.hex : nil
            }
        #expect(result.count == 2)
        #expect(result[0] == (1, "1", 2, "2"))
        #expect(result[1] == (2, "2", 4, "4"))
    }
}
