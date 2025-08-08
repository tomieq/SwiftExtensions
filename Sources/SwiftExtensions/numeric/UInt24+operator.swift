//
//  UInt24+operator.swift
//  SwiftExtensions
//
//  Created by Tomasz on 08/08/2025.
//


public func +(lhs: UInt24, rhs: UInt24) -> UInt24 {
    UInt24(lhs.int + rhs.int)
}

public func -(lhs: UInt24, rhs: UInt24) -> UInt24 {
    UInt24(lhs.int - rhs.int)
}

public func *(lhs: UInt24, rhs: UInt24) -> UInt24 {
    UInt24(lhs.int * rhs.int)
}
