//
//  UnicodeScalar+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 20/03/2025.
//

import Foundation

enum UnicodeScalarError: Error {
    case illegalCharacter(String)
}

extension UnicodeScalar {
    func hex2byte() throws -> UInt8 {
        let value = self.value
        if 48 <= value, value <= 57 {
            return UInt8(value - 48)
        } else if 65 <= value, value <= 70 {
            return UInt8(value - 55)
        } else if 97 <= value, value <= 102 {
            return UInt8(value - 87)
        }
        throw UnicodeScalarError.illegalCharacter("Sign \(value) is not valid hex number")
    }
}
