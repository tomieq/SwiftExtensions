//
//  Data+String.swift
//  SwiftExtensions
// 
//  Created by: tomieq on 07/05/2026
//
import Foundation

public extension Data {
    
    var utf8: String? {
        return String(data: self, encoding: .utf8)
    }
}


