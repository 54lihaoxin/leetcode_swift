//
//  main.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 8/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

final class TestDriver {
    static func runTestsOfChallenges(_ challenges: [Challenge.Type]) {
        challenges.forEach { challenge in
            print("[\(challenge.name)] begins")
            challenge.runTests()
            print("[\(challenge.name)] ends")
            print()
        }
    }
}

TestDriver.runTestsOfChallenges([
    Challenge_3304.self,
//    Challenge_1137.self,
//    Challenge_985.self,
//    Challenge_984.self,
//    Challenge_976.self,
//    Challenge_973.self,
//    Challenge_970.self,
//    Challenge_965.self,
//    Challenge_949.self,
//    Challenge_885.self,
//    Challenge_695.self,
//    Challenge_509.self,
//    Challenge_70.self,
])
