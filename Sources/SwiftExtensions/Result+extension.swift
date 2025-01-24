//
//  Result+extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 24/01/2025.
//

extension Result {
    public init(_ work: () throws -> Success) where Failure == Error {
        do {
            let value = try work()
            self = .success(value)
        } catch {
            self = .failure(error)
        }
    }
}

extension Result {
    @discardableResult
    public func onSuccess(_ handler: (Success) -> ()) -> Self {
        guard case let .success(value) = self else { return self }
        handler(value)
        return self
    }
    @discardableResult
    public func onFailure(_ handler: (Failure) -> ()) -> Self {
        guard case let .failure(error) = self else { return self }
        handler(error)
        return self
    }
}
