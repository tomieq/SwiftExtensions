//
//  Set+Extension.swift
//  SwiftExtensions
//
//  Created by Tomasz on 01/09/2025.
//

import Foundation

public extension Set {
    var array: [Element] {
        Array(self)
    }
}
