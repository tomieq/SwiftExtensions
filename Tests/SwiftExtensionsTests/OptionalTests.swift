//
//  OptionalTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//



import Testing
import Foundation
import SwiftExtensions

struct OptionalTests {
    
    private func produce<T>(_ value: T?) -> T? {
        value
    }
    
    @Test func recover() {
        var value = produce(5).or(12)
        #expect(value == 5)
        value = produce(nil).or(10)
        #expect(value == 10)
    }
    
    @Test func onNil() {
        var flowControl: [Int] = .empty
        produce(nil).map { $0 * 2 }
            .onNil {
                flowControl.append(-1)
            }
            .onValue { number in
                flowControl.append(number)
            }
        #expect(flowControl == [-1])
    }
    
    @Test func onValue() {
        var flowControl: [Int] = .empty
        produce(5).map { $0 * 2 }
            .onNil {
                flowControl.append(-1)
            }
            .onValue { number in
                flowControl.append(number)
            }
        #expect(flowControl == [10])
    }
    
    @Test func initThrowing() {
        enum SomeError: Error {
            case invalid
        }
        func positive() throws -> Int {
            5
        }
        func negative() throws -> Int {
            throw SomeError.invalid
        }
        #expect(Optional{ try positive() }.or(10) == 5)
        #expect(Optional{ try negative() }.or(10) == 10)
    }
    
    @Test func map() {
        func converter(_ number: Int) -> Bool {
            number.above(10)
        }
        let value = produce(5)
        #expect(value.map { converter($0) } == false)
    }
}
