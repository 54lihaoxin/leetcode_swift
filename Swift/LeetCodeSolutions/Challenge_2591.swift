//
//  Challenge_2591.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 10/6/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 2591. Distribute Money to Maximum Children
 Easy
 Topics
 Companies
 Hint
 You are given an integer money denoting the amount of money (in dollars) that you have and another integer children denoting the number of children that you must distribute the money to.

 You have to distribute the money according to the following rules:

 All money must be distributed.
 Everyone must receive at least 1 dollar.
 Nobody receives 4 dollars.
 Return the maximum number of children who may receive exactly 8 dollars if you distribute the money according to the aforementioned rules. If there is no way to distribute the money, return -1.



 Example 1:

 Input: money = 20, children = 3
 Output: 1
 Explanation:
 The maximum number of children with 8 dollars will be 1. One of the ways to distribute the money is:
 - 8 dollars to the first child.
 - 9 dollars to the second child.
 - 3 dollars to the third child.
 It can be proven that no distribution exists such that number of children getting 8 dollars is greater than 1.
 Example 2:

 Input: money = 16, children = 2
 Output: 2
 Explanation: Each child can be given 8 dollars.


 Constraints:

 1 <= money <= 200
 2 <= children <= 30

 */

import Foundation

enum Challenge_2591: Challenge {

    static let name = "Challenge 2591"

    static func runTests() {
        let solution = Solution()
        guard 1 == solution.distMoney(20, 3) else { fatalError() }
        guard 2 == solution.distMoney(16, 2) else { fatalError() }
        guard 0 == solution.distMoney(2, 2) else { fatalError() }
        guard 0 == solution.distMoney(8, 2) else { fatalError() }
        guard 1 == solution.distMoney(17, 2) else { fatalError() }
        guard -1 == solution.distMoney(1, 2) else { fatalError() }
        guard 1 == solution.distMoney(10, 3) else { fatalError() }
        guard 1 == solution.distMoney(11, 3) else { fatalError() }
        guard 0 == solution.distMoney(12, 2) else { fatalError() }
        guard 1 == solution.distMoney(12, 3) else { fatalError() }
    }
}

fileprivate final class Solution {
    // Solution from https://leetcode.com/problems/distribute-money-to-maximum-children/solutions/4300688/swift-simple-conditions-math-solution
    func distMoney(_ money: Int, _ children: Int) -> Int
    {
        // No way to distribute the money
        if money < children { return -1 }

        // First, we give each child one dollar, so that everyone gets something,
        // and count how many children we can give seven more to.
        // Obviously, this number cannot be greater than the number of all children

        var resultChildren = min((money - children) / 7, children)  // kids that receive $8
        var leftChildren: Int { children - resultChildren }         // rest kids that do not receive $8

        if (leftChildren == 0 && money != resultChildren * 8) ||  // No children left and the sum doesn't even out
           (leftChildren == 1 && money == resultChildren * 8 + 4) // One remaining child receives an unacceptable $4
        {
            resultChildren -= 1 // We have to sacrifice one $8-child to fix the situation
        }

        return resultChildren
    }
}
