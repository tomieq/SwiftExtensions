import Testing
import Foundation
@testable import SwiftExtensions

@Test func dataFromHexString() async throws {
    let hex = "53893267"
    let expected = Data([0x53, 0x89, 0x32, 0x67])
    #expect(Data(hexString: hex) == expected)
}

@Test func uint8Hex() async throws {
    #expect(UInt8(0x21).hexString == "21")
    #expect(UInt8(0xFF).hexString == "ff")
}
