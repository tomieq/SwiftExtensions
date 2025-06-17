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
            let bytes = self.bytes
            switch count {
            case 1:
                return Int(bytes[0])
            case 2:
                return Int(bytes[0]) << 8 + Int(bytes[1])
            case 3:
                return Int(bytes[0]) << 16 + Int(bytes[1]) << 8 + Int(bytes[2])
            case 4:
                let high = Int(bytes[0]) << 24 + Int(bytes[1]) << 16
                let low = Int(bytes[2]) << 8 + Int(bytes[3])
                return high + low
            default:
                throw DataToNumberConvertError.tooManyOfBytes
            }
        }
    }
}
