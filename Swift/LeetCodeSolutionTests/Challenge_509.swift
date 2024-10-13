//
//  Challenge_695.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

/*
 
 509. Fibonacci Number
 Easy

 5516

 296

 Add to List

 Share
 The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

 F(0) = 0, F(1) = 1
 F(n) = F(n - 1) + F(n - 2), for n > 1.
 Given n, calculate F(n).

  

 Example 1:

 Input: n = 2
 Output: 1
 Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
 Example 2:

 Input: n = 3
 Output: 2
 Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
 Example 3:

 Input: n = 4
 Output: 3
 Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
  

 Constraints:

 0 <= n <= 30
 Accepted
 1,114,612
 Submissions
 1,610,767
 
 */

import XCTest

final class SolutionTests509: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual(0, solution.fib(0))
        XCTAssertEqual(1, solution.fib(1))
        XCTAssertEqual(1, solution.fib(2))
        XCTAssertEqual(2, solution.fib(3))
        XCTAssertEqual(3, solution.fib(4))
    }
}

fileprivate final class Solution {
    private var n_vs_result: [Int: Int] = [0:0, 1:1]

    func fib(_ n: Int) -> Int {
        guard n >= 0 else { return 0 }

        if let result = n_vs_result[n] {
            return result
        } else {
            let result = fib(n - 2) + fib(n - 1)
            n_vs_result[n] = result
            return result
        }
    }
}
