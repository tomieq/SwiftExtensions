//
//  ResultTests.swift
//  SwiftExtensions
//
//  Created by Tomasz on 22/05/2025.
//

import Testing
import Foundation
import SwiftExtensions

struct ResultTests {
    
    enum UserError: Error {
        case loginTaken
    }
    
    struct User {
        let login: String
    }
    
    func make(success: Bool) -> Result<User, UserError> {
        if success {
            return .success(User(login: "John"))
        } else {
            return .failure(.loginTaken)
        }
    }
    
    @Test func positive() {
        var flowControl: [Int] = []
        make(success: true)
            .onFailure { _ in
                flowControl.append(-1)
            }
            .onSuccess { _ in
                flowControl.append(1)
            }
        #expect(flowControl == [1])
    }
    
    @Test func negative() {
        var flowControl: [Int] = []
        make(success: false)
            .onFailure { _ in
                flowControl.append(-1)
            }
            .onSuccess { _ in
                flowControl.append(1)
            }
        #expect(flowControl == [-1])
    }
    
    @Test func always() {
        var flowControl: [Int] = []
        make(success: true)
            .onFailure { _ in
                flowControl.append(-1)
            }
            .onSuccess { _ in
                flowControl.append(1)
            }
            .always {
                flowControl.append(3)
            }
        #expect(flowControl == [1, 3])
    }
}
