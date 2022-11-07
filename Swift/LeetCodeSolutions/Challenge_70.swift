//
//  Challenge_70.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

import Foundation

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

import Foundation

enum Challenge_70: Challenge {

    static let name = "Challenge 70"

    static func runTests() {
        let solution = Solution()
        guard 0 == solution.climbStairs(0) else { fatalError() }
        guard 1 == solution.climbStairs(1) else { fatalError() }
        guard 2 == solution.climbStairs(2) else { fatalError() }
        guard 3 == solution.climbStairs(3) else { fatalError() }
        guard 5 == solution.climbStairs(4) else { fatalError() }
        print("All tests passed")
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
