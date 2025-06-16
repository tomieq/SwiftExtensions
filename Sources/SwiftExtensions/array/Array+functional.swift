//
//  Array+functional.swift
//  SwiftExtensions
//
//  Created by Tomasz on 26/05/2025.
//

public extension Array {
    @discardableResult
    func onEmpty(_ closure: () -> Void) -> Self {
        if isEmpty {
            closure()
        }
        return self
    }

    @discardableResult
    func onEmpty(_ closure: () throws -> Void) throws -> Self {
        if isEmpty {
            try closure()
        }
        return self
    }
}

public extension Array {
    @discardableResult
    func collect(_ closure: ([Element]) -> Void) -> Self {
        closure(self)
        return self
    }

    @discardableResult
    func collect(_ closure: ([Element]) throws -> Void) throws -> Self {
        try closure(self)
        return self
    }
}

public extension Array {
    func zip<N>(_ make: (Element) -> N) -> [(Element, N)] {
        self.map {
            return ($0, make($0))
        }
    }
    
    func zip<A, B, N>(_ make: (A, B) -> N) -> [(A, B, N)] where Element == (A, B) {
        self.map { pair in
            let (a, b) = pair
            return (a, b, make(a, b))
        }
    }
    
    func zip<A, B, C, N>(_ make: (A, B, C) -> N) -> [(A, B, C, N)] where Element == (A, B, C) {
        self.map { combo in
            let (a, b, c) = combo
            return (a, b, c, make(a, b, c))
        }
    }
    
    func zip<A, B, C, D, N>(_ make: (A, B, C, D) -> N) -> [(A, B, C, D, N)] where Element == (A, B, C, D) {
        self.map { combo in
            let (a, b, c, d) = combo
            return (a, b, c, d, make(a, b, c, d))
        }
    }
}

// compactZip will filter out the tuple if callback will return nil
public extension Array {
    func compactZip<N>(_ make: (Element) -> N?) -> [(Element, N)] {
        self.compactMap {
            guard let right = make($0) else {
                return nil
            }
            return ($0, right)
        }
    }
    
    func compactZip<A, B, N>(_ make: (A, B) -> N?) -> [(A, B, N)] where Element == (A, B) {
        compactMap { pair in
            let (a, b) = pair
            guard let n = make(a, b) else { return nil }
            return (a, b, n)
        }
    }
    
    func compactZip<A, B, C, N>(_ make: (A, B, C) -> N?) -> [(A, B, C, N)] where Element == (A, B, C) {
        compactMap { combo in
            let (a, b, c) = combo
            guard let n = make(a, b, c) else { return nil }
            return (a, b, c, n)
        }
    }
    
    func compactZip<A, B, C, D, N>(_ make: (A, B, C, D) -> N?) -> [(A, B, C, D, N)] where Element == (A, B, C, D) {
        compactMap { combo in
            let (a, b, c, d) = combo
            guard let n = make(a, b, c, d) else { return nil }
            return (a, b, c, d, n)
        }
    }
}
