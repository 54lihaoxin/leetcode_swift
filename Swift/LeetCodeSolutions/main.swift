//
//  main.swift
//  LeetCodeSolutions
//
//  Created by Li, Haoxin on 8/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

let challenges: [Challenge.Type] = [
    Challenge_509.self,
//    Challenge_695.self,
//    Challenge_885.self,
//    Challenge_949.self,
//    Challenge_965.self,
//    Challenge_970.self,
//    Challenge_973.self,
//    Challenge_976.self,
//    Challenge_984.self,
//    Challenge_985.self,
]

challenges.forEach { challenge in
    print("[\(challenge.name)] begins")
    challenge.runTests()
    print("[\(challenge.name)] ends")
    print()
}
