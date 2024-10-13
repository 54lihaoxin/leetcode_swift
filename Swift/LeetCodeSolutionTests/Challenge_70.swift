//
//  Challenge_70.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

/*

 70. Climbing Stairs
 Easy

 15234

 449

 Add to List

 Share
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?



 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step


 Constraints:

 1 <= n <= 45
 Accepted
 1,975,744
 Submissions
 3,818,828

 */

import XCTest

final class SolutionTests70: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual(0, solution.climbStairs(0))
        XCTAssertEqual(1, solution.climbStairs(1))
        XCTAssertEqual(2, solution.climbStairs(2))
        XCTAssertEqual(3, solution.climbStairs(3))
        XCTAssertEqual(5, solution.climbStairs(4))
    }
}

fileprivate final class Solution {
    private var n_vs_result: [Int: Int] = [0:0, 1:1, 2:2]

    func climbStairs(_ n: Int) -> Int {
        guard n >= 0 else { return 0 }

        if let result = n_vs_result[n] {
            return result
        } else {
            let result = climbStairs(n - 2) + climbStairs(n - 1) // Fibonacci with different base case
            n_vs_result[n] = result
            return result
        }
    }
}
