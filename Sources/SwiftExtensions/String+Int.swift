//
//  String+Int.swift
//  SwiftExtensions
//
//  Created by Tomasz on 19/03/2025.
//

extension String {
    var decimal: Int? {
        Int(decimal: self)
    }

    var binary: Int? {
        Int(binary: self)
    }

    var hex: Int? {
        Int(hex: self)
    }
}
