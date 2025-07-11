//
//  Data+numbers.swift
//  SwiftExtensions
//
//  Created by Tomasz on 25/04/2025.
//
import Foundation

public enum DataToNumberConvertError: Error {
    case notEnoughNumberOfBytes(expected: Int, actual: Int)
    case tooManyBytes(expected: Int, actual: Int)
    case valueOutOfRange(UInt64)
}

extension Data {
    // bytes need to be in big endian order, if not, use Data.swappedBytes
    public var uInt8: UInt8 {
        get throws {
            guard self.isEmpty.not else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 1, actual: count)
            }
            return UInt8(self[startIndex])
        }
    }
    // bytes need to be in big endian order, if not, use Data.swappedBytes
    public var uInt16: UInt16 {
        get throws {
            guard self.count > 1 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 2, actual: count)
            }
            return UInt16(self[startIndex]) << 8 + UInt16(self[startIndex + 1])
        }
    }
    // bytes need to be in big endian order, if not, use Data.swappedBytes
    public var uInt24: UInt24 {
        get throws {
            guard self.count > 2 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 3, actual: count)
            }
            return UInt24(Int(self[startIndex]) << 16 + Int(self[startIndex + 1]) << 8 + Int(self[startIndex + 2]))
        }
    }
    // bytes need to be in big endian order, if not, use Data.swappedBytes
    public var uInt32: UInt32 {
        get throws {
            guard self.count > 3 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 4, actual: count)
            }
            return self.prefix(4).reduce(UInt32(0)) { (result, byte) in
                (result << 8) | UInt32(byte)
            }
        }
    }
    // bytes need to be in big endian order, if not, use Data.swappedBytes
    public var uInt64: UInt64 {
        get throws {
            guard self.count > 7 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 4, actual: count)
            }
            return self.prefix(8).reduce(UInt64(0)) { (result, byte) in
                (result << 8) | UInt64(byte)
            }
        }
    }
}

extension Data {
    // big endian byte order required, no strict checking for data lenght, just converting to Int
    public var int: Int {
        get throws {
            guard self.isEmpty.not else {
                 throw DataToNumberConvertError.notEnoughNumberOfBytes(expected: 1, actual: count)
             }
             if count > 8 {
                 throw DataToNumberConvertError.tooManyBytes(expected: 8, actual: count)
             }

             var value: UInt64 = 0
             for byte in self {
                 value = (value << 8) | UInt64(byte)
             }
             if value > UInt64(Int.max) {
                 throw DataToNumberConvertError.valueOutOfRange(value)
             }

             return Int(value)
        }
    }
}
