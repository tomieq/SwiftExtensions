//
//  Array+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

public enum ArrayError: Error {
    case cutError(String)
}

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
        self[range].array
    }

    public func subArray(_ range: ClosedRange<Int>) -> [Element] {
        self[range].array
    }

    public func subArray(_ range: PartialRangeFrom<Int>) -> [Element] {
        self[range].array
    }

    public func subArray(_ range: PartialRangeThrough<Int>) -> [Element] {
        self[range].array
    }

    public func subArray(_ range: PartialRangeUpTo<Int>) -> [Element] {
        self[range].array
    }
}

extension Array {
    public func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            self[$0..<Swift.min($0 + chunkSize, self.count)].array
        }
    }

    // cuts array into equal subarrays
    public func cut(into parts: Int) throws -> [[Element]] {
        guard self.count % parts == 0 else {
            throw ArrayError.cutError("Cannot cut array into \(parts) subarrays as the array length is not dividable by \(parts)")
        }
        return self.chunked(by: self.count / parts)
    }
}
