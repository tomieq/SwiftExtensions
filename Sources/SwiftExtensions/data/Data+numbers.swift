//
//  Data+numbers.swift
//  SwiftExtensions
//
//  Created by Tomasz on 25/04/2025.
//
import Foundation

public enum DataToNumberConvertError: Error {
    case notEnoughNumberOfBytes
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
    public var uInt32: UInt32 {
        get throws {
            guard self.count > 3 else {
                throw DataToNumberConvertError.notEnoughNumberOfBytes
            }
            return UInt32(self[startIndex]) << 24 + UInt32(self[startIndex + 1]) << 16 + UInt32(self[startIndex + 2]) << 8 + UInt32(self[startIndex + 3])
        }
    }
}
