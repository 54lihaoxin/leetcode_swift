//
//  Challenge.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/6/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

import Foundation

protocol Challenge {
    static var name: String { get }
    static func runTests()
}
