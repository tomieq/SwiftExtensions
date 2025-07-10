//
//  Data+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 20/03/2025.
//

import Foundation

public enum DataError: Error {
    case outOfIndex
}

extension Data {
    public init(hexString: String) {
        let scalars = hexString.unicodeScalars
        var bytes = Array<UInt8>(repeating: 0, count: (scalars.count + 1) >> 1)
        for (index, scalar) in scalars.enumerated() {
            guard var byte = try? scalar.hex2byte() else {
                print("Error while initializing Data from hexString \(hexString)")
                self = Data()
                return
            }
            if index & 1 == 0 {
                byte <<= 4
            }
            bytes[index >> 1] |= byte
        }
        self = Data(bytes)
    }

    public var hexString: String {
        self.map{ String(format: "%02hhX", $0) }.joined()
    }
    
    public var bytes: [UInt8] {
        [UInt8](self)
    }
}

public extension Data {
    func appending(_ other: Data) -> Data {
        var copy = self
        copy.append(other)
        return copy
    }
    func appending(_ other: UInt8) -> Data {
        var copy = self
        copy.append(other)
        return copy
    }
    func appending(_ other: UInt16) -> Data {
        var copy = self
        copy.append(other.data)
        return copy
    }
    func appending(_ other: UInt24) -> Data {
        var copy = self
        copy.append(other.data)
        return copy
    }
    func appending(_ other: UInt32) -> Data {
        var copy = self
        copy.append(other.data)
        return copy
    }
    // aliases
    func appending(asOneByte number: Int) -> Data {
        appending(number.uInt8)
    }
    func appending(asTwoBytes number: Int) -> Data {
        appending(number.uInt16)
    }
    func appending(asThreeBytes number: Int) -> Data {
        appending(number.uInt24)
    }
    func appending(asFourBytes number: Int) -> Data {
        appending(number.uInt32)
    }
}

// helpul to change little-endian to big-endian and the other direction
// useful when you operate on Int values in binary format
public extension Data {
    var swappedBytes: Data {
        Data(self.reversed())
    }
}
