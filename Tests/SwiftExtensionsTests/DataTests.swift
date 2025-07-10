//
//  DataTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 17/06/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct DataTests {
    
    @Test func toInt() throws {
        #expect(try Data([0x9]).int == 9)
        #expect(try Data([0x9]).uInt8 == 9)
        
        #expect(try Data([0x8, 0x1]).int == 2049)
        #expect(try Data([0x8, 0x1]).uInt16 == 2049)
        
        #expect(try Data([0x9, 0xa, 0xf]).int == 592399)
        
        #expect(try Data([0xc, 0x2, 0xd, 0x3]).int == 201460995)
        #expect(try Data([0xc, 0x2, 0xd, 0x3]).uInt32 == 201460995)
    }
    
    @Test func swapBytes() throws {
        let number = UInt32(678)
        print("little endian: \(number.bigEndian)")
        #expect(try number.bigEndian == number.data.swappedBytes.uInt32)
    }
    
    @Test func appendingNumbers() throws {
        let data = Data(hexString: "A0")
            .appending(5.uInt8)
            .appending(8.uInt16)
            .appending(3.uInt24)
            .appending(9.uInt32)
        #expect(data.hexString == "A005000800000300000009")
        let aliased = Data(hexString: "A0")
            .appending(asOneByte: 5)
            .appending(asTwoBytes: 8)
            .appending(asThreeBytes: 3)
            .appending(asFourBytes: 9)
        #expect(aliased.hexString == "A005000800000300000009")
    }
    @Test func appendEnumUInt8() throws {
        enum TestEnum: UInt8 {
            case five = 5
            case six = 6
        }
        var data = Data()
        data.append(TestEnum.five)
        data.append(TestEnum.six)
        #expect(data.hexString == "0506")
        
        let onTheFly = Data()
            .appending(TestEnum.five)
            .appending(TestEnum.six)
        #expect(onTheFly.hexString == "0506")
    }
    @Test func appendEnumUInt16() throws {
        enum TestEnum: UInt16 {
            case five = 5
            case six = 6
        }
        var data = Data()
        data.append(TestEnum.five)
        data.append(TestEnum.six)
        #expect(data.hexString == "00050006")
        
        let onTheFly = Data()
            .appending(TestEnum.five)
            .appending(TestEnum.six)
        #expect(onTheFly.hexString == "00050006")
    }
    @Test func appendEnumUInt32() throws {
        enum TestEnum: UInt32 {
            case five = 5
            case six = 6
        }
        var data = Data()
        data.append(TestEnum.five)
        data.append(TestEnum.six)
        #expect(data.hexString == "0000000500000006")
        
        let onTheFly = Data()
            .appending(TestEnum.five)
            .appending(TestEnum.six)
        #expect(onTheFly.hexString == "0000000500000006")
    }
}
