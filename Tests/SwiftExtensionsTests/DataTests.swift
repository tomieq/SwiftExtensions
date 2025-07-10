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
}
