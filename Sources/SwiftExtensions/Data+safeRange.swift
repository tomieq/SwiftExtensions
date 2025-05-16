//
//  Data+safeRange.swift
//  SwiftExtensions
//
//  Created by Tomasz on 16/05/2025.
//
import Foundation

extension Data {
    public func slice(_ range: Range<Int>) -> Data {
        Data(self.bytes[range])
    }
    public func slice(_ range: ClosedRange<Int>) -> Data {
        Data(self.bytes[range])
    }
    public func slice(_ range: PartialRangeFrom<Int>) -> Data {
        Data(self.bytes[range])
    }
    public func slice(_ range: PartialRangeThrough<Int>) -> Data {
        Data(self.bytes[range])
    }
    public func slice(_ range: PartialRangeUpTo<Int>) -> Data {
        Data(self.bytes[range])
    }
}
