//
//  Array+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

public enum ArrayError: Error {
    case cutError(String)
    case outOfIndex
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

extension Array {
    public var tuple: (Element, Element) {
        get throws {
            guard self.count > 1 else {
                throw ArrayError.outOfIndex
            }
            return (self[0], self[1])
        }
    }
    public var triple: (Element, Element, Element) {
        get throws {
            guard self.count > 2 else {
                throw ArrayError.outOfIndex
            }
            return (self[0], self[1], self[2])
        }
    }
    public var quadruple: (Element, Element, Element, Element) {
        get throws {
            guard self.count > 3 else {
                throw ArrayError.outOfIndex
            }
            return (self[0], self[1], self[2], self[3])
        }
    }
}
