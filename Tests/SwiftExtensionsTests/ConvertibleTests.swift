//
//  ConvertibleTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ConvertibleTests {
    @Test func convert() {
        struct User: Convertible {
            let login: String
        }

        struct CarUser {
            let login: String
            let licenceID: String
        }
        
        let user = User(login: "John")
        let carUser = user.map {
            CarUser(login: $0.login, licenceID: "WA 89000")
        }
        #expect(carUser.login == user.login)
        #expect(carUser.licenceID == "WA 89000")
    }
}
