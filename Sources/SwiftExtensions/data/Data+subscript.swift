//
//  Data+subscript.swift
//  SwiftExtensions
//
//  Created by Tomasz on 17/06/2025.
//
import Foundation

extension Data {
    public subscript(safeIndex index: Int) -> Element? {
        get {
            guard index >= 0, index < count else { return nil }
            return self[index]
        }

        set(newValue) {
            guard let value = newValue, index >= 0, index < count else { return }
            self[index] = value
        }
    }
}

extension Data {
    public subscript(safeRange range: Range<Int>) -> Data {
        Data(self.bytes[safeRange: range])
    }
    public subscript(safeRange range: ClosedRange<Int>) -> Data {
        Data(self.bytes[safeRange: range])
    }
    public subscript(safeRange range: PartialRangeFrom<Int>) -> Data {
        Data(self.bytes[safeRange: range])
    }
    public subscript(safeRange range: PartialRangeThrough<Int>) -> Data {
        Data(self.bytes[safeRange: range])
    }
    public subscript(safeRange range: PartialRangeUpTo<Int>) -> Data {
        Data(self.bytes[safeRange: range])
    }
}
