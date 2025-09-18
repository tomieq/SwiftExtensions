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
    
    public var array: [UInt8] {
        [UInt8](self)
    }
}

extension Data: DataConvertible {
    public var data: Data { self }
}

// helpul to change little-endian to big-endian and the other direction
// useful when you operate on Int values in binary format
public extension Data {
    var swappedBytes: Data {
        Data(self.reversed())
    }
}
