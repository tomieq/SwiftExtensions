//
//  Array+safeRange.swift
//  SwiftExtensions
//
//  Created by Tomasz on 16/05/2025.
//


extension Array {
    /// n..<m
    public subscript(safeRange range: Range<Int>) -> [Element] {
        guard isEmpty.not else { return [] }
        let start = Swift.max(Swift.min(endIndex, range.lowerBound), 0)
        let end = Swift.max(Swift.min(endIndex, range.upperBound), 0)
        return self[start..<end].array
    }
    /// n...m
    public subscript(safeRange range: ClosedRange<Int>) -> [Element] {
        guard isEmpty.not else { return [] }
        let start = Swift.max(Swift.min(endIndex, range.lowerBound), 0)
        let end = Swift.max(Swift.min(endIndex.decremented, range.upperBound), 0)
        guard start < end else {
            if range.upperBound == startIndex { return [self[0]] }
            if range.lowerBound == endIndex.decremented { return [self.last!] }
            return []
        }
        return self[start...end].array
    }
    /// n...
    public subscript(safeRange range: PartialRangeFrom<Int>) -> [Element] {
        guard isEmpty.not, range.lowerBound < endIndex else { return [] }
        return self[safeRange: range.lowerBound...endIndex]
    }
    /// ...n
    public subscript(safeRange range: PartialRangeThrough<Int>) -> [Element] {
        guard isEmpty.not else { return [] }
        if range.upperBound == startIndex { return [self[0]] }
        guard range.upperBound > startIndex else { return [] }
        return self[safeRange: startIndex...range.upperBound]
    }
    /// ...<n
    public subscript(safeRange range: PartialRangeUpTo<Int>) -> [Element] {
        guard isEmpty.not else { return [] }
        guard range.upperBound > startIndex else { return [] }
        return self[safeRange: startIndex..<range.upperBound]
    }
}

extension Array {
    public func subArray(_ range: Range<Int>) -> [Element] {
        self[safeRange: range]
    }

    public func subArray(_ range: ClosedRange<Int>) -> [Element] {
        self[safeRange: range]
    }

    public func subArray(_ range: PartialRangeFrom<Int>) -> [Element] {
        self[safeRange: range]
    }

    public func subArray(_ range: PartialRangeThrough<Int>) -> [Element] {
        self[safeRange: range]
    }

    public func subArray(_ range: PartialRangeUpTo<Int>) -> [Element] {
        self[safeRange: range]
    }
}
