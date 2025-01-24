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
    public func onSuccess(_ callback: (Success) -> Void) -> Self {
        switch self {
        case .success(let value):
            callback(value)
        case .failure:
            break
        }
        return self
    }
    public func onFailure(_ callback: (Failure) -> Void) -> Self {
        switch self {
        case .success:
            break
        case .failure(let failure):
            callback(failure)
        }
        return self
    }
}
