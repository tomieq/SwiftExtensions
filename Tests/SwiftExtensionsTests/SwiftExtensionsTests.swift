import Testing
import Foundation
@testable import SwiftExtensions

@Test func dataFromHexString() async throws {
    let hex = "53893267"
    let expected = Data([0x53, 0x89, 0x32, 0x67])
    #expect(Data(hexString: hex) == expected)
}

@Test func dataHex() async throws {
    #expect(Data([0x21, 0xFF]).hexString == "21FF")
}

@Test func uint8Hex() async throws {
    #expect(UInt8(0x21).hexString == "21")
    #expect(UInt8(0xFF).hexString == "FF")
}

@Test func uint16Hex() async throws {
    #expect(UInt16(0x21).hexString == "0021")
    #expect(UInt16(0x03FF).hexString == "03FF")
}

@Test func uint32Hex() async throws {
    #expect(UInt32(0x21569037).hexString == "21569037")
    #expect(UInt32(0x00009037).hexString == "00009037")
}

@Test func uint16Data() async throws {
    #expect(UInt16(0x21).data == Data([0x00, 0x21]))
    #expect(UInt16(0x03FF).data == Data([0x03, 0xFF]))
}

@Test func uint32Data() async throws {
    #expect(UInt32(0x21569037).data == Data([0x21, 0x56, 0x90, 0x37]))
}

@Test func uint16FromData() async throws {
    #expect(try Data([0x00, 0x21]).uInt16 == UInt16(0x21))
    #expect(try Data([0x03, 0xFF]).uInt16 == UInt16(0x03FF))
}

@Test func uint32FromData() async throws {
    #expect(try [0x00, 0x00, 0x00, 0x21].data.uInt32 == UInt32(0x21))
    #expect(try [0x00, 0x00, 0x03, 0xFF].data.uInt32 == UInt32(0x03FF))
    #expect(try [0xC3, 0x00, 0x03, 0xFF].data.uInt32 == UInt32(0xC30003FF))
}

@Test func dataToBytes() async throws {
    #expect(Data([0x00, 0x00, 0x00, 0x21]).bytes == [0x00, 0x00, 0x00, 0x21])
}

@Test func uint64Data() async throws {
    let number = UInt64(0xA5C0124421569037)
    #expect(number.data == Data([0xA5, 0xC0, 0x12, 0x44,0x21, 0x56, 0x90, 0x37]))
}

@Test func uint64FromData() async throws {
    #expect(try [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21].data.uInt64 == UInt64(0x21))
    #expect(try [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFF].data.uInt64 == UInt64(0x03FF))
    #expect(try [0xC3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xFF].data.uInt64 == UInt64(0xC3000000000003FF))
}
