//
//  Array+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Array {
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

extension Array where Element: Equatable {
    public var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}

extension Array where Element: Hashable {
    public func commonElements(with other: [Element]) -> [Element] {
        Array(Set(self).intersection(Set(other)))
    }
}

extension Array {
    public func subArray(_ range: Range<Int>) -> [Element] {
        Array(self[range])
    }

    public func subArray(_ range: ClosedRange<Int>) -> [Element] {
        Array(self[range])
    }

    public func subArray(_ range: PartialRangeFrom<Int>) -> [Element] {
        Array(self[range])
    }

    public func subArray(_ range: PartialRangeThrough<Int>) -> [Element] {
        Array(self[range])
    }

    public func subArray(_ range: PartialRangeUpTo<Int>) -> [Element] {
        Array(self[range])
    }
}
