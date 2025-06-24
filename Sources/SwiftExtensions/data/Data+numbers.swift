//
//  Data+numbers.swift
//  SwiftExtensions
//
//  Created by Tomasz on 25/04/2025.
//
import Foundation

public enum DataToNumberConvertError: Error {
    case notEnoughNumberOfBytes
    case tooManyOfBytes
}

extension Data {
    // big endian
    public var uInt8: UInt8 {
        get throws {
            guard self.isEmpty.not else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes
            }
            return UInt8(self[startIndex])
        }
    }
    // big endian
    public var uInt16: UInt16 {
        get throws {
            guard self.count > 1 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes
            }
            return UInt16(self[startIndex]) << 8 + UInt16(self[startIndex + 1])
        }
    }
    // big endian
    public var uInt24: UInt24 {
        get throws {
            guard self.count > 2 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes
            }
            return UInt24(Int(self[startIndex]) << 16 + Int(self[startIndex + 1]) << 8 + Int(self[startIndex + 2]))
        }
    }

    // big endian
    public var uInt32: UInt32 {
        get throws {
            guard self.count > 3 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes
            }
            return UInt32(self[startIndex]) << 24 + UInt32(self[startIndex + 1]) << 16 + UInt32(self[startIndex + 2]) << 8 + UInt32(self[startIndex + 3])
        }
    }
}

extension Data {
    // big endian, no strict checking for data lenght, just converting to Int
    public var int: Int {
        get throws {
            guard self.isEmpty.not else {
                 throw DataToNumberConvertError.notEnoughNumberOfBytes
             }
             if count > 8 {
                 throw DataToNumberConvertError.tooManyOfBytes
             }

             var value: UInt64 = 0
             for byte in self {
                 value = (value << 8) | UInt64(byte)
             }
             if value > UInt64(Int.max) {
                 throw DataToNumberConvertError.tooManyOfBytes
             }

             return Int(value)
        }
    }
}
