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
}
