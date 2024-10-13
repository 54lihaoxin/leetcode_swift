//
//  Challenge_970.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/9/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 970. Powerful Integers
 
 Given two non-negative integers x and y, an integer is powerful if it is equal to x^i + y^j for some integers i >= 0 and j >= 0.
 
 Return a list of all powerful integers that have value less than or equal to bound.
 
 You may return the answer in any order.  In your answer, each value should occur at most once.
 
 Example 1:
 
 Input: x = 2, y = 3, bound = 10
 Output: [2,3,4,5,7,9,10]
 Explanation:
 2 = 2^0 + 3^0
 3 = 2^1 + 3^0
 4 = 2^0 + 3^1
 5 = 2^1 + 3^1
 7 = 2^2 + 3^1
 9 = 2^3 + 3^0
 10 = 2^0 + 3^2
 Example 2:
 
 Input: x = 3, y = 5, bound = 15
 Output: [2,4,6,8,10,14]
 
 
 Note:
 
 1 <= x <= 100
 1 <= y <= 100
 0 <= bound <= 10^6
 
 */

import XCTest


final class SolutionTests970: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual([2,3,4,5,7,9,10], solution.powerfulIntegers(2, 3, 10))
    }
}

fileprivate final class Solution {
    func powerfulIntegers(_ x: Int, _ y: Int, _ bound: Int) -> [Int] {
        var result = Set<Int>()
        
        for i in 0...Int.max {
            let xPower = Int(pow(Double(x), Double(i)))
            if xPower > bound {
                break
            }
            
            for j in 0...Int.max {
                let yPower = Int(pow(Double(y), Double(j)))
                let sum =  xPower + yPower
                if sum > bound {
                    break
                } else {
                    result.insert(sum)
                }
                
                if y == 1 { // 1 ^ n is always 1, so we need to break the loop
                    break
                }
            }
            
            if x == 1 { // 1 ^ n is always 1, so we need to break the loop
                break
            }
        }
        
        return result.sorted()
    }
}
