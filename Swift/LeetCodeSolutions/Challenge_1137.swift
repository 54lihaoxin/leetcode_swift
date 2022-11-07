//
//  Challenge_1137.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

import Foundation

/*

 1137. N-th Tribonacci Number
 Easy

 2396

 129

 Add to List

 Share
 The Tribonacci sequence Tn is defined as follows:

 T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

 Given n, return the value of Tn.



 Example 1:

 Input: n = 4
 Output: 4
 Explanation:
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 Example 2:

 Input: n = 25
 Output: 1389537


 Constraints:

 0 <= n <= 37
 The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.
 Accepted
 357,564
 Submissions
 564,641

 */

import Foundation

enum Challenge_1137: Challenge {

    static let name = "Challenge 1137"

    static func runTests() {
        let solution = Solution()
        guard 0 == solution.tribonacci(0) else { fatalError() }
        guard 1 == solution.tribonacci(1) else { fatalError() }
        guard 1 == solution.tribonacci(2) else { fatalError() }
        guard 2 == solution.tribonacci(3) else { fatalError() }
        guard 4 == solution.tribonacci(4) else { fatalError() }
        guard 7 == solution.tribonacci(5) else { fatalError() }
        guard 13 == solution.tribonacci(6) else { fatalError() }
        guard 1389537 == solution.tribonacci(25) else { fatalError() }
        print("All tests passed")
    }
}

fileprivate final class Solution {
    private var n_vs_result: [Int: Int] = [0:0, 1:1, 2:1]

    func tribonacci(_ n: Int) -> Int {
        guard n >= 0 else { return 0 }

        if let result = n_vs_result[n] {
            return result
        } else {
            let result = tribonacci(n - 3) + tribonacci(n - 2) + tribonacci(n - 1)
            n_vs_result[n] = result
            return result
        }
    }
}
